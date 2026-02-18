import 'package:flutter/material.dart';
import 'package:host_bridge/host_bridge.dart';

class CommandLineScreen extends StatefulWidget {
  const CommandLineScreen({super.key});

  @override
  State<CommandLineScreen> createState() => _CommandLineScreenState();
}

class _CommandLineScreenState extends State<CommandLineScreen> {
  late final String _hostBridgeUrl;
  late final HostBridgeClient _bridgeClient;
  final _commandController = TextEditingController(
    text: 'echo "Hello from host_bridge"',
  );
  final _workingDirController = TextEditingController();
  bool _loading = false;
  String? _stdout;
  String? _stderr;
  int? _exitCode;
  String? _error;

  @override
  void initState() {
    super.initState();
    _hostBridgeUrl = const String.fromEnvironment('HOST_BRIDGE_URL');
    _bridgeClient = HostBridgeClient(_hostBridgeUrl);
  }

  @override
  void dispose() {
    _commandController.dispose();
    _workingDirController.dispose();
    super.dispose();
  }

  Future<void> _runCommand() async {
    final command = _commandController.text.trim();
    if (command.isEmpty) return;
    final workingDir = _workingDirController.text.trim();
    setState(() {
      _loading = true;
      _error = null;
      _stdout = null;
      _stderr = null;
      _exitCode = null;
    });
    try {
      final result = await _bridgeClient.runCommand(
        RunCommandRequestModel(
          command: command,
          workingDirectory: workingDir.isEmpty ? null : workingDir,
          timeoutSeconds: 30,
        ),
      );
      setState(() {
        _stdout = result.stdout;
        _stderr = result.stderr;
        _exitCode = result.exitCode;
        _loading = false;
      });
    } catch (e, st) {
      setState(() {
        _error = '$e\n\n$st';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Host bridge ($_hostBridgeUrl)',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _commandController,
              decoration: const InputDecoration(
                labelText: 'Command',
                hintText: 'e.g. ls -la or echo hello',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
              enabled: !_loading,
              onSubmitted: (_) => _runCommand(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _workingDirController,
              decoration: const InputDecoration(
                labelText: 'Working directory (optional)',
                hintText: 'e.g. /tmp or leave empty for default',
                border: OutlineInputBorder(),
              ),
              enabled: !_loading,
              onSubmitted: (_) => _runCommand(),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: _loading ? null : _runCommand,
              icon: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.play_arrow),
              label: Text(_loading ? 'Running…' : 'Run command'),
            ),
            if (_error != null) ...[
              const SizedBox(height: 16),
              const Text(
                'Error',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  _error!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                    fontFamily: 'monospace',
                    fontSize: 12,
                  ),
                ),
              ),
            ],
            if (_exitCode != null) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    'Exit code: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$_exitCode',
                    style: TextStyle(
                      color: _exitCode == 0
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ],
            if (_stdout != null && _stdout!.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Text(
                'stdout',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.topLeft,
                child: SelectableText(
                  _stdout!,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                ),
              ),
            ],
            if (_stderr != null && _stderr!.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Text(
                'stderr',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.errorContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.topLeft,
                child: SelectableText(
                  _stderr!,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onErrorContainer,
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
