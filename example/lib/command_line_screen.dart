import 'dart:async';

import 'package:flutter/material.dart';
import 'package:host_bridge/host_bridge.dart';

class CommandLineScreen extends StatefulWidget {
  const CommandLineScreen({super.key});

  @override
  State<CommandLineScreen> createState() => _CommandLineScreenState();
}

enum _LoadingCommand { run, runAdvanced }

class _CommandLineScreenState extends State<CommandLineScreen> {
  late final String _hostBridgeUrl;
  late final HostBridgeClient _bridgeClient;
  final _commandController = TextEditingController(text: 'host_bridge');
  final _workingDirController = TextEditingController();
  _LoadingCommand? _loadingCommand;
  String? _stdout;
  String? _stderr;
  int? _exitCode;
  String? _error;
  StreamSubscription<RunAdvancedCommandResponseModel>? _advancedSubscription;
  Timer? _waitingTimer;
  bool _waitingForOutput = false;
  int? _currentPid;

  @override
  void initState() {
    super.initState();
    _hostBridgeUrl = const String.fromEnvironment('HOST_BRIDGE_URL');
    _bridgeClient = HostBridgeClient(_hostBridgeUrl);
  }

  @override
  void dispose() {
    _advancedSubscription?.cancel();
    _waitingTimer?.cancel();
    _commandController.dispose();
    _workingDirController.dispose();
    super.dispose();
  }

  Future<void> _killAdvancedCommand() async {
    if (_currentPid == null) return;
    try {
      await _bridgeClient.runCommand(
        RunCommandRequestModel(command: 'kill -9 $_currentPid'),
      );
    } catch (e, st) {
      setState(() {
        _error = '$e\n\n$st';
      });
    }
  }

  Future<void> _runCommand() async {
    final command = _commandController.text.trim();
    if (command.isEmpty) return;
    final workingDir = _workingDirController.text.trim();
    setState(() {
      _loadingCommand = _LoadingCommand.run;
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
        _loadingCommand = null;
      });
    } catch (e, st) {
      setState(() {
        _error = '$e\n\n$st';
        _loadingCommand = null;
      });
    }
  }

  Future<void> _runAdvancedCommand() async {
    final command = _commandController.text.trim();
    if (command.isEmpty) return;
    final workingDir = _workingDirController.text.trim();
    setState(() {
      _loadingCommand = _LoadingCommand.runAdvanced;
      _error = null;
      _stdout = '';
      _stderr = '';
      _exitCode = null;
      _waitingForOutput = false;
      _currentPid = null;
    });
    var stdoutBuffer = StringBuffer();
    var stderrBuffer = StringBuffer();
    _waitingTimer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        if (_loadingCommand == _LoadingCommand.runAdvanced &&
            (_stdout == null || _stdout!.isEmpty) &&
            (_stderr == null || _stderr!.isEmpty)) {
          _waitingForOutput = true;
        }
      });
    });
    _advancedSubscription = _bridgeClient
        .runAdvancedCommand(
          RunCommandRequestModel(
            command: command,
            workingDirectory: workingDir.isEmpty ? null : workingDir,
          ),
        )
        .listen(
          (event) {
            _waitingTimer?.cancel();
            _waitingTimer = null;

            switch (event) {
              case RunAdvancedCommandResponseModelData(
                :final stdout,
                :final exitCode,
                :final pid,
              ):
                _currentPid ??= pid;
                if (stdout.isNotEmpty) stdoutBuffer.write(stdout);
                setState(() {
                  _stdout = stdoutBuffer.toString();
                  _stderr = stderrBuffer.toString();
                  _waitingForOutput = false;
                  if (stdout.isEmpty) _exitCode = exitCode; // final event
                });
              case RunAdvancedCommandResponseModelError(:final stderr):
                if (stderr.isNotEmpty) stderrBuffer.write(stderr);
                setState(() {
                  _stdout = stdoutBuffer.toString();
                  _stderr = stderrBuffer.toString();
                  _waitingForOutput = false;
                });
            }
          },
          onError: (e, st) {
            _waitingTimer?.cancel();
            _waitingTimer = null;
            _advancedSubscription = null;
            setState(() {
              _error = '$e\n\n$st';
              _loadingCommand = null;
              _waitingForOutput = false;
              _currentPid = null;
            });
          },
          onDone: () {
            _waitingTimer?.cancel();
            _waitingTimer = null;
            _advancedSubscription = null;
            setState(() {
              _loadingCommand = null;
              _waitingForOutput = false;
              _currentPid = null;
            });
          },
        );
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
              enabled: _loadingCommand == null,
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
              enabled: _loadingCommand == null,
              onSubmitted: (_) => _runCommand(),
            ),
            const SizedBox(height: 12),
            Wrap(
              children: [
                FilledButton.icon(
                  onPressed: _loadingCommand != null ? null : _runCommand,
                  icon: _loadingCommand == _LoadingCommand.run
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.play_arrow),
                  label: Text(
                    _loadingCommand == _LoadingCommand.run
                        ? 'Running…'
                        : 'Run command',
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton.tonalIcon(
                  onPressed: _loadingCommand != null
                      ? null
                      : _runAdvancedCommand,
                  icon: _loadingCommand == _LoadingCommand.runAdvanced
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.stream),
                  label: Text(
                    _loadingCommand == _LoadingCommand.runAdvanced
                        ? 'Running…'
                        : 'Run advanced',
                  ),
                ),
                if (_loadingCommand == _LoadingCommand.runAdvanced) ...[
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: _currentPid != null
                        ? _killAdvancedCommand
                        : null,
                    icon: const Icon(Icons.stop),
                    label: Text(
                      _currentPid != null ? 'Kill (PID $_currentPid)' : 'Stop',
                    ),
                  ),
                ],
              ],
            ),
            if (_waitingForOutput) ...[
              const SizedBox(height: 12),
              Text(
                'Waiting for output… (long-running processes may buffer)',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
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
