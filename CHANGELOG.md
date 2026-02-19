## 1.1.0

- **Streaming command execution**: New `/run_advanced_command` endpoint that streams command output in real time via Server-Sent Events (SSE).
- **RunAdvancedCommandResponseModel**: Sealed model for advanced command responses:
  - `error` – failure info (`stderr`, `exitCode`).
  - `data` – final result when the process exits (`exitCode`, `stdout`, `pid`).
- **HostBridgeClient.runAdvancedCommand()**: Returns `Stream<RunAdvancedCommandResponseModel>`; use for long-running commands to receive output incrementally.
- Server uses `Process.start` for advanced commands (with optional timeout) and streams log events until the process exits.

## 1.0.1

- Package metadata and layout prepared for pub.dev (description, homepage, repository, topics, platforms, LICENSE, README).

## 1.0.0

- Initial version.
- CLI executable `host_bridge` to run the bridge server.
- Library: `HostBridgeClient`, file op and run_command models.
- Endpoints: `/file_op`, `/run_command`, `/ping`.
