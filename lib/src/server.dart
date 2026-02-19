import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:alfred/alfred.dart';
import 'package:emojis/emojis.dart';
import 'package:host_bridge/src/json_string_mapper.dart';
import 'package:host_bridge/src/models/file_post_op_model.dart';
import 'package:host_bridge/src/models/file_response_model.dart';
import 'package:host_bridge/src/models/run_advanced_command_response_model.dart';
import 'package:host_bridge/src/models/run_command_request_model.dart';
import 'package:host_bridge/src/models/run_command_response_model.dart';
import 'package:host_bridge/src/urls.dart';

String _processOutputToString(dynamic output) {
  if (output == null) return '';
  if (output is String) return output;
  if (output is List<int>) return String.fromCharCodes(output);
  return output.toString();
}

List<int> _toSseBytes(RunAdvancedCommandResponseModel model) {
  return utf8.encode('data: ${model.toJson()}\n\n');
}

Stream<List<int>> _streamCommandLog({
  required String executable,
  required List<String> arguments,
  String? workingDirectory,
  int? timeoutSeconds,
}) async* {
  final process = await Process.start(
    executable,
    arguments,
    workingDirectory: workingDirectory,
  );
  final pid = process.pid;

  if (timeoutSeconds != null) {
    Future.delayed(Duration(seconds: timeoutSeconds), () {
      final isKilled = process.kill();
      if (!isKilled) {
        process.kill(ProcessSignal.sigkill);
      }
    });
  }

  var stdoutDone = false;
  var stderrDone = false;
  var exitEmitted = false;

  void maybeEmitExit(StreamController<List<int>> controller,
      {bool isKilled = false}) {
    if (exitEmitted) return;
    if (stdoutDone && stderrDone) {
      exitEmitted = true;
      process.exitCode.then((exitCode) {
        controller.add(_toSseBytes(
          RunAdvancedCommandResponseModelData(
            exitCode: exitCode,
            stdout: '',
            pid: pid,
          ),
        ));
        controller.close();
      });
    } else if (isKilled) {
      exitEmitted = true;
      controller.add(_toSseBytes(
        RunAdvancedCommandResponseModelData(
          exitCode: 1,
          stdout: '',
          pid: pid,
        ),
      ));
      controller.close();
    }
  }

  final controller = StreamController<List<int>>();
  process.exitCode.whenComplete(() {
    maybeEmitExit(controller, isKilled: true);
  });
  process.stdout.transform(utf8.decoder).listen(
    (chunk) {
      controller.add(_toSseBytes(
        RunAdvancedCommandResponseModelData(
            stdout: chunk, exitCode: 0, pid: pid),
      ));
    },
    onDone: () {
      stdoutDone = true;
      maybeEmitExit(controller);
    },
    onError: (e, st) => controller.addError(e, st),
  );

  process.stderr.transform(utf8.decoder).listen(
    (chunk) {
      controller.add(_toSseBytes(
        RunAdvancedCommandResponseModelError(stderr: chunk, exitCode: 1),
      ));
    },
    onDone: () {
      stderrDone = true;
      maybeEmitExit(controller);
    },
    onError: (e, st) => controller.addError(e, st),
  );

  yield* controller.stream;
}

class Server {
  final Alfred _app = Alfred(logLevel: LogType.debug);
  Server();

  Future<void> run() async {
    _app.all('*', cors(origin: '*'));

    _app.post(Urls.fileOp, (req, res) async {
      final fileOpContext = FilePostOpModelMapper.fromMap(
        (await req.bodyAsJsonMap),
      );

      switch (fileOpContext) {
        case FilePostOpModelWriteMap():
          final file = File(fileOpContext.path);
          final directoryPath = file.parent.path;
          final directory = Directory(directoryPath);
          if (!directory.existsSync()) {
            // The 'recursive: true' flag is essential here to create all intermediate directories
            directory.createSync(recursive: true);
            print('Created directory: $directoryPath');
          }

          file.writeAsStringSync(
            JsonStringMapper.mapToString(fileOpContext.content),
          );
          return const VoidFileResponse().toJson();
        case FilePostOpModelWriteString():
          final file = File(fileOpContext.path);
          final directoryPath = file.parent.path;
          final directory = Directory(directoryPath);
          if (!directory.existsSync()) {
            // The 'recursive: true' flag is essential here to create all intermediate directories
            directory.createSync(recursive: true);
            print('Created directory: $directoryPath');
          }

          file.writeAsStringSync(fileOpContext.content);
          return const VoidFileResponse().toJson();
        case FilePostOpModelDelete():
          final file = File(fileOpContext.path);
          file.deleteSync();
          return const VoidFileResponse().toJson();

        case FilePostOpModelRead():
          final file = File(fileOpContext.path);
          if (!file.existsSync()) {
            return FileNotFoundResponse().toJson();
          }
          return StringFileResponse(response: file.readAsStringSync()).toJson();
      }
    });

    _app.get(
      '/',
      (req, res) =>
          'Host Bridge is running! Post to /file_op for file operations, /run_command to run terminal commands.',
    );

    _app.get(Urls.ping, (req, res) {
      final sessionFile = Platform.environment['HOST_BRIDGE_SESSION_FILE'];
      if (sessionFile != null && sessionFile.isNotEmpty) {
        try {
          File(sessionFile).writeAsStringSync('');
        } catch (_) {}
      }
      return 'pong';
    });

    _app.post(Urls.runCommand, (req, res) async {
      final body = RunCommandRequestModelMapper.fromMap(
        await req.bodyAsJsonMap,
      );
      final executable = Platform.isWindows ? 'cmd' : '/bin/sh';
      final arguments =
          Platform.isWindows ? ['/c', body.command] : ['-c', body.command];
      var runFuture = Process.run(
        executable,
        arguments,
        workingDirectory: body.workingDirectory,
      );
      if (body.timeoutSeconds != null) {
        runFuture = runFuture.timeout(
          Duration(seconds: body.timeoutSeconds!),
          onTimeout: () => throw TimeoutException(
            'Command timed out after ${body.timeoutSeconds} seconds',
          ),
        );
      }
      final result = await runFuture;
      final response = RunCommandResponseModel(
        stdout: _processOutputToString(result.stdout),
        stderr: _processOutputToString(result.stderr),
        exitCode: result.exitCode,
      );
      return response.toJson();
    });

    _app.post(Urls.runCommandGetStream, (req, res) async {
      final body = RunCommandRequestModelMapper.fromMap(
        await req.bodyAsJsonMap,
      );
      final executable = Platform.isWindows ? 'cmd' : '/bin/sh';
      final arguments =
          Platform.isWindows ? ['/c', body.command] : ['-c', body.command];

      res.headers.contentType = ContentType('text', 'event-stream');
      res.headers.set('Cache-Control', 'no-cache');
      res.headers.set('Connection', 'keep-alive');
      res.bufferOutput = false;

      return _streamCommandLog(
        executable: executable,
        arguments: arguments,
        workingDirectory: body.workingDirectory,
        timeoutSeconds: body.timeoutSeconds,
      );
    });

    await _app.listen(0);
    final port = _app.server!.port;
    // Print immediately (flush) so start_host_bridge.sh sees it when stdout is redirected
    stdout.writeln('${Emojis.compass} Listening on port $port');
    stdout.flush();
    String? localIp;
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4 && !addr.isLoopback) {
          localIp = addr.address;
          break;
        }
      }
      if (localIp != null) break;
    }
    stdout.writeln('Connect at http://${localIp ?? '127.0.0.1'}:$port');
    stdout.flush();
  }
}
