import 'dart:async';
import 'dart:io';
import 'package:alfred/alfred.dart';
import 'package:emojis/emojis.dart';
import 'package:host_bridge/src/json_string_mapper.dart';
import 'package:host_bridge/src/models/file_post_op_model.dart';
import 'package:host_bridge/src/models/file_response_model.dart';
import 'package:host_bridge/src/models/run_command_request_model.dart';
import 'package:host_bridge/src/models/run_command_response_model.dart';

String _processOutputToString(dynamic output) {
  if (output == null) return '';
  if (output is String) return output;
  if (output is List<int>) return String.fromCharCodes(output);
  return output.toString();
}

class Server {
  final Alfred _app = Alfred(logLevel: LogType.debug);
  Server();

  Future<void> run() async {
    _app.all('*', cors(origin: '*'));

    _app.post('file_op', (req, res) async {
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

    _app.get('/ping', (req, res) => 'pong');

    _app.post('/run_command', (req, res) async {
      final body = RunCommandRequestModelMapper.fromMap(
        await req.bodyAsJsonMap,
      );
      final executable = Platform.isWindows ? 'cmd' : '/bin/sh';
      final arguments = Platform.isWindows
          ? ['/c', body.command]
          : ['-c', body.command];
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

    await _app.listen(0);
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
    print(
      '${Emojis.compass} Listening on http://${localIp!}:${_app.server!.port}',
    );
  }
}
