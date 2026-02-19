import 'dart:async';
import 'dart:convert';

import 'package:host_bridge/src/models/file_post_op_model.dart';
import 'package:host_bridge/src/models/file_response_model.dart';
import 'package:host_bridge/src/models/run_advanced_command_response_model.dart';
import 'package:host_bridge/src/models/run_command_request_model.dart';
import 'package:host_bridge/src/models/run_command_response_model.dart';
import 'package:host_bridge/src/urls.dart';
import 'package:http/http.dart' as http;

class HostBridgeClient {
  final String _hostBridgeUrl;
  static const Duration _timeout = Duration(seconds: 5);
  const HostBridgeClient(this._hostBridgeUrl);
  Future<FileResponseModel> fileOp(FilePostOpModel fileOpModel,
      {Duration timeout = _timeout}) async {
    final response = await http.post(
      Uri.parse('$_hostBridgeUrl${Urls.fileOp}'),
      body: fileOpModel.toJson(),
      headers: {'Content-Type': 'application/json'},
    ).timeout(timeout);
    if (response.statusCode == 200) {
      return FileResponseModelMapper.fromJson(response.body);
    } else {
      throw Exception('Failed to perform file operation');
    }
  }

  Future<String?> ping({Duration timeout = _timeout}) async {
    final response = await http
        .get(Uri.parse('$_hostBridgeUrl${Urls.ping}'))
        .timeout(timeout);
    return response.body;
  }

  Future<RunCommandResponseModel> runCommand(
    RunCommandRequestModel request, {
    Duration timeout = _timeout,
  }) async {
    final response = await http.post(
      Uri.parse('$_hostBridgeUrl${Urls.runCommand}'),
      body: request.toJson(),
      headers: {'Content-Type': 'application/json'},
    ).timeout(timeout);
    if (response.statusCode == 200) {
      return RunCommandResponseModelMapper.fromJson(response.body);
    } else {
      throw Exception('Failed to run command');
    }
  }

  /// Runs a command and returns an SSE stream of output chunks.
  /// Use this for long-running commands to receive stdout/stderr in real time.
  Stream<RunAdvancedCommandResponseModel> runAdvancedCommand(
    RunCommandRequestModel request, {
    Duration connectTimeout = _timeout,
  }) async* {
    final req = http.Request(
      'POST',
      Uri.parse('$_hostBridgeUrl${Urls.runCommandGetStream}'),
    );
    req.headers['Content-Type'] = 'application/json';
    req.body = request.toJson();

    final client = http.Client();
    final response = await client.send(req).timeout(connectTimeout);
    if (response.statusCode != 200) {
      client.close();
      throw Exception('Failed to run advanced command: ${response.statusCode}');
    }

    try {
      var buffer = '';
      await for (final chunk in response.stream.transform(utf8.decoder)) {
        buffer += chunk;
        final events = buffer.split('\n\n');
        buffer = events.removeLast();
        for (final event in events) {
          for (final line in event.split('\n')) {
            if (!line.startsWith('data: ')) continue;
            final json = line.substring(6);
            if (json.isEmpty) continue;
            yield RunAdvancedCommandResponseModelMapper.fromJson(json);
          }
        }
      }
      if (buffer.isNotEmpty) {
        for (final line in buffer.split('\n')) {
          if (!line.startsWith('data: ')) continue;
          final json = line.substring(6);
          if (json.isEmpty) continue;
          yield RunAdvancedCommandResponseModelMapper.fromJson(json);
        }
      }
    } finally {
      client.close();
    }
  }
}
