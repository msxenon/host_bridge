import 'package:host_bridge/src/models/file_post_op_model.dart';
import 'package:host_bridge/src/models/file_response_model.dart';
import 'package:host_bridge/src/models/run_command_request_model.dart';
import 'package:host_bridge/src/models/run_command_response_model.dart';
import 'package:http/http.dart' as http;

class HostBridgeClient {
  final String _hostBridgeUrl;
  static const Duration timeout = Duration(seconds: 5);
  const HostBridgeClient(this._hostBridgeUrl);
  Future<FileResponseModel> fileOp(FilePostOpModel fileOpModel) async {
    final response = await http
        .post(
          Uri.parse('$_hostBridgeUrl/file_op'),
          body: fileOpModel.toJson(),
          headers: {'Content-Type': 'application/json'},
        )
        .timeout(timeout);
    if (response.statusCode == 200) {
      return FileResponseModelMapper.fromJson(response.body);
    } else {
      throw Exception('Failed to perform file operation');
    }
  }

  Future<String?> ping() async {
    final response = await http
        .get(Uri.parse('$_hostBridgeUrl/ping'))
        .timeout(timeout);
    return response.body;
  }

  Future<RunCommandResponseModel> runCommand(
    RunCommandRequestModel request,
  ) async {
    final response = await http
        .post(
          Uri.parse('$_hostBridgeUrl/run_command'),
          body: request.toJson(),
          headers: {'Content-Type': 'application/json'},
        )
        .timeout(timeout);
    if (response.statusCode == 200) {
      return RunCommandResponseModelMapper.fromJson(response.body);
    } else {
      throw Exception('Failed to run command');
    }
  }
}
