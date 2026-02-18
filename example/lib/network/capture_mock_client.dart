import 'dart:convert';

import 'package:host_bridge/host_bridge.dart';

class CaptureMockWrapper {
  final String tag;
  static const String _hostBridgeUrl = String.fromEnvironment(
    'HOST_BRIDGE_URL',
  );
  static const HostBridgeClient _hostBridge = HostBridgeClient(_hostBridgeUrl);
  CaptureMockWrapper({required this.tag});

  Future<String?> getLocalStorageFileResponse({
    required String path,
    required String method,
  }) async {
    final client = await _hostBridge.fileOp(
      FilePostOpModelRead(path: '$tag/captured_data/$path/${method}_res.json'),
    );
    if (client is StringFileResponse) {
      return client.response;
    }
    return null;
  }

  Future<void> setLocalStorageFile({
    required String path,
    required String method,
    required String content,
    required Map<String, String>? headers,
    required String fullUrl,
  }) async {
    await _hostBridge.fileOp(
      FilePostOpModelWriteString(
        path: '$tag/captured_data/$path/${method}_req.json',
        content: jsonEncode({'url': fullUrl, 'headers': headers}),
      ),
    );
    await _hostBridge.fileOp(
      FilePostOpModelWriteString(
        path: '$tag/captured_data/$path/${method}_res.json',
        content: content,
      ),
    );
  }
}
