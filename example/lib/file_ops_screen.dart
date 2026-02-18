import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:host_bridge/host_bridge.dart';

import 'package:example/src/network/http_client/http_network_client.dart';

class FileOpsScreen extends StatefulWidget {
  const FileOpsScreen({super.key});

  @override
  State<FileOpsScreen> createState() => _FileOpsScreenState();
}

class _FileOpsScreenState extends State<FileOpsScreen> {
  late final String _hostBridgeUrl;
  late final HostBridgeClient _bridgeClient;
  bool _loading = false;
  String? _lastRequest;
  String? _lastResponse;
  int? _lastStatus;
  String? _lastError;
  bool _responseFromMock = false;
  bool _lastRecorded = false;

  bool _isRecording = false;
  bool _isMockMode = false;
  late HttpNetworkClient _httpNetworkClient;

  final _customUrlController = TextEditingController(
    text: 'https://jsonplaceholder.typicode.com/posts/1',
  );
  final _customPostBodyController = TextEditingController(
    text: '{"title":"foo","body":"bar","userId":1}',
  );
  final _filePathController = TextEditingController(
    text: 'example/tmp/demo.txt',
  );
  final _writeContentController = TextEditingController(
    text: 'Hello from host_bridge',
  );

  void _rebuildHttpNetworkClient() {
    _httpNetworkClient = HttpNetworkClient(
      isRecording: _isRecording,
      isMockMode: _isMockMode,
    );
  }

  @override
  void initState() {
    super.initState();
    _hostBridgeUrl = const String.fromEnvironment('HOST_BRIDGE_URL');
    _bridgeClient = HostBridgeClient(_hostBridgeUrl);
    _rebuildHttpNetworkClient();
  }

  @override
  void dispose() {
    _customUrlController.dispose();
    _customPostBodyController.dispose();
    _filePathController.dispose();
    _writeContentController.dispose();
    super.dispose();
  }

  Future<void> _pingHostBridge() async {
    setState(() {
      _loading = true;
      _lastError = null;
      _lastRequest = 'GET $_hostBridgeUrl/';
      _responseFromMock = false;
      _lastRecorded = false;
    });
    try {
      final response = await _bridgeClient.ping();
      _setResponse(200, response ?? '');
    } catch (e, st) {
      _setError(e, st);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _readFile() async {
    final path = _filePathController.text.trim();
    if (path.isEmpty) {
      setState(() => _lastError = 'Enter a file path');
      return;
    }
    final op = FilePostOpModelRead(path: path);
    setState(() {
      _loading = true;
      _lastError = null;
      _lastRequest = 'POST $_hostBridgeUrl/file_op\n${op.toJson()}';
      _responseFromMock = false;
      _lastRecorded = false;
    });
    try {
      final model = await _bridgeClient.fileOp(op);
      _setResponse(200, jsonEncode(model.toJson()));
    } catch (e, st) {
      _setError(e, st);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _writeFile() async {
    final path = _filePathController.text.trim();
    final content = _writeContentController.text;
    if (path.isEmpty) {
      setState(() => _lastError = 'Enter a file path');
      return;
    }
    final op = FilePostOpModelWriteString(path: path, content: content);
    setState(() {
      _loading = true;
      _lastError = null;
      _lastRequest = 'POST $_hostBridgeUrl/file_op\n${op.toJson()}';
      _responseFromMock = false;
      _lastRecorded = false;
    });
    try {
      final model = await _bridgeClient.fileOp(op);
      _setResponse(200, jsonEncode(model.toJson()));
    } catch (e, st) {
      _setError(e, st);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _sendCustomGet() async {
    final url = _customUrlController.text.trim();
    if (url.isEmpty) {
      setState(() => _lastError = 'Enter a URL');
      return;
    }
    setState(() {
      _loading = true;
      _lastError = null;
      _lastRequest = 'GET $url';
      _responseFromMock = false;
      _lastRecorded = false;
    });
    try {
      final response = await _httpNetworkClient.get(url);
      if (!mounted) return;
      setState(() {
        _lastStatus = response.statusCode;
        _lastResponse = response.body;
        _responseFromMock = _isMockMode;
        _lastRecorded = _isRecording;
      });
    } catch (e, st) {
      _setError(e, st);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _sendCustomPost() async {
    final url = _customUrlController.text.trim();
    final body = _customPostBodyController.text.trim();
    if (url.isEmpty) {
      setState(() => _lastError = 'Enter a URL');
      return;
    }
    setState(() {
      _loading = true;
      _lastError = null;
      _lastRequest = 'POST $url\n$body';
      _responseFromMock = false;
      _lastRecorded = false;
    });
    try {
      final response = await _httpNetworkClient.post(url, body);
      if (!mounted) return;
      setState(() {
        _lastStatus = response.statusCode;
        _lastResponse = response.body;
        _responseFromMock = _isMockMode;
        _lastRecorded = _isRecording;
      });
    } catch (e, st) {
      _setError(e, st);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _setResponse(int status, String body) {
    if (!mounted) return;
    setState(() {
      _lastStatus = status;
      _lastResponse = body;
    });
  }

  void _setError(Object e, StackTrace st) {
    if (!mounted) return;
    setState(() {
      _lastError = '$e';
      _lastResponse = st.toString();
      _lastStatus = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('File ops · Host bridge ($_hostBridgeUrl)'),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  onPressed: _loading ? null : _pingHostBridge,
                  icon: _loading
                      ? SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.network_ping),
                  label: const Text('Ping host_bridge'),
                ),
                FilledButton.tonalIcon(
                  onPressed: _loading ? null : _readFile,
                  icon: const Icon(Icons.folder_open),
                  label: const Text('Read file'),
                ),
                FilledButton.tonalIcon(
                  onPressed: _loading ? null : _writeFile,
                  icon: const Icon(Icons.edit),
                  label: const Text('Write file'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _filePathController,
              decoration: const InputDecoration(
                labelText: 'File path (for read/write)',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _writeContentController,
              decoration: const InputDecoration(
                labelText: 'Content (for write)',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            Text(
              'HttpNetworkClient — Custom HTTP requests',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Record saves responses via host_bridge. Mock replays saved responses.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                FilterChip(
                  label: const Text('Record'),
                  selected: _isRecording,
                  onSelected: _loading
                      ? null
                      : (v) {
                          setState(() {
                            _isRecording = v;
                            _rebuildHttpNetworkClient();
                          });
                        },
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Use mock'),
                  selected: _isMockMode,
                  onSelected: _loading
                      ? null
                      : (v) {
                          setState(() {
                            _isMockMode = v;
                            _rebuildHttpNetworkClient();
                          });
                        },
                ),
              ],
            ),
            if (_isRecording || _isMockMode)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  _isRecording && _isMockMode
                      ? 'Recording + mock: new requests hit network and are saved; mock uses saved data when present.'
                      : _isRecording
                      ? 'Recording: responses will be saved to host_bridge storage.'
                      : 'Mock: responses will be served from host_bridge storage when available.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            const SizedBox(height: 8),
            TextField(
              controller: _customUrlController,
              decoration: const InputDecoration(
                labelText: 'URL',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _customPostBodyController,
              decoration: const InputDecoration(
                labelText: 'Body (for POST)',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.tonalIcon(
                  onPressed: _loading ? null : _sendCustomGet,
                  icon: const Icon(Icons.get_app),
                  label: const Text('Send GET'),
                ),
                FilledButton.tonalIcon(
                  onPressed: _loading ? null : _sendCustomPost,
                  icon: const Icon(Icons.send),
                  label: const Text('Send POST'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_lastError != null)
              Card(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SelectableText(
                    _lastError!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ),
            if (_lastRequest != null) ...[
              Text('Request', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 4),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SelectableText(
                    _lastRequest!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
            if (_lastStatus != null || _lastResponse != null) ...[
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Response ${_lastStatus != null ? "($_lastStatus)" : ""}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  if (_responseFromMock) ...[
                    const SizedBox(width: 8),
                    Chip(
                      label: const Text('From mock'),
                      avatar: const Icon(
                        Icons.storage,
                        size: 18,
                        color: Colors.amber,
                      ),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                  if (_lastRecorded) ...[
                    const SizedBox(width: 8),
                    Chip(
                      label: const Text('Recorded'),
                      avatar: const Icon(
                        Icons.fiber_manual_record,
                        size: 18,
                        color: Colors.green,
                      ),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 4),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SelectableText(
                    _lastResponse ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
