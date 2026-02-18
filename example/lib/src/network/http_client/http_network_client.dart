import 'package:http/http.dart' as http;
import 'package:example/network/network_client.dart';
import 'package:example/network/capture_mock_client.dart';

class HttpNetworkClient extends NetworkClient<http.Response> {
  HttpNetworkClient({required super.isRecording, required super.isMockMode})
    : _inner = http.Client();
  final http.Client _inner;
  final CaptureMockWrapper captureMockWrapper = CaptureMockWrapper(tag: 'http');

  @override
  Future<http.Response> get(String url) async {
    if (isMockMode) {
      final file = await captureMockWrapper.getLocalStorageFileResponse(
        path: url,
        method: 'GET',
      );
      if (file != null) {
        return http.Response(file, 200);
      }
    }
    final response = await _inner.get(Uri.parse(url));
    if (isRecording) {
      await captureMockWrapper.setLocalStorageFile(
        path: url,
        method: 'GET',
        content: response.body,
        headers: response.headers,
        fullUrl: url,
      );
    }
    return response;
  }

  @override
  Future<http.Response> post(String url, data) async {
    if (isMockMode) {
      final file = await captureMockWrapper.getLocalStorageFileResponse(
        path: url,
        method: 'POST',
      );
      if (file != null) {
        return http.Response(file, 200);
      }
    }
    final response = await _inner.post(Uri.parse(url), body: data);
    if (isRecording) {
      await captureMockWrapper.setLocalStorageFile(
        path: url,
        method: 'POST',
        content: response.body,
        headers: response.headers,
        fullUrl: url,
      );
    }
    return response;
  }
}
