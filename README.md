# host_bridge
[![Pub](https://img.shields.io/pub/v/host_bridge.svg)](https://pub.dev/packages/host_bridge)

A Dart CLI and library that runs a local HTTP bridge server for **file operations** and **shell commands**. Use it from IDEs, scripts, or other tools to perform host-side file I/O and command execution (e.g., when the caller runs in a sandbox or remote environment).

## Features

- **CLI** – Run the bridge server with a single command.
- **Library** – Use `HostBridgeClient` and typed models in your Dart app to talk to the server.
- **Endpoints**:
  - `POST /file_op` – Read, write (string or JSON map), or delete files; creates parent directories as needed.
  - `POST /run_command` – Run a shell command with optional working directory and timeout.
  - `GET /ping` – Health check (returns `pong`).

## Installation

### CLI (global)

```bash
dart pub global activate host_bridge
```

Then run:

```bash
host_bridge
```

The server binds to a random port and prints the URL (e.g. `http://192.168.1.2:port`).

### Library

Add to your `pubspec.yaml`:

```yaml
dependencies:
  host_bridge: ^1.0.1
```

Then use the library:

```dart
import 'package:host_bridge/host_bridge.dart';

void main() async {
  final client = HostBridgeClient('http://localhost:8080');

  // Ping
  final pong = await client.ping();
  print(pong); // pong

  // Run a command
  final result = await client.runCommand(RunCommandRequestModel(
    command: 'echo hello',
    workingDirectory: null,
    timeoutSeconds: 10,
  ));
  print(result.stdout); // hello
  print(result.exitCode); // 0

  // File operations (e.g. write string)
  await client.fileOp(FilePostOpModelWriteString(
    path: '/tmp/example.txt',
    content: 'Hello, host_bridge!',
  ));
}
```

## API overview

- **Server** – Start the server programmatically via `Server()` and `server.run()` (see `bin/host_bridge.dart`).
- **HostBridgeClient** – `fileOp()`, `runCommand()`, `ping()`.
- **Models** – `FilePostOpModel` (write map/string, delete, read), `FileResponseModel`, `RunCommandRequestModel`, `RunCommandResponseModel`.

## Example use cases

Use host_bridge when your app or tests run in a sandbox (e.g. simulator, device, CI) but need the **host machine** to run commands or touch files. Point your app at the bridge URL; the bridge runs on the host and does the work.

- **Send a local notification in the iOS simulator** – From integration tests or the app, call the bridge to run `xcrun simctl push <udid> <bundle-id> payload.json` on the host. Verifies notification handling without manual steps or external services.

- **Trigger local backend / feature flags** – Toggle flags or config that your local backend reads from disk. From the client, use `fileOp` to write or overwrite a flag file (e.g. `feature_x_enabled.json`) in the backend’s config directory; the backend picks up the change and your test can assert on the new behavior.

- **Reset simulators** – From tests or tooling, ask the host to reset a simulator (e.g. `xcrun simctl erase <udid>`) or boot/shutdown devices. Keeps test runs repeatable without leaving the test process.

- **Capture API requests and responses** – Have the host write captured HTTP traffic to a known directory (e.g. under a project folder). Tests or the app use `fileOp` to read those files and assert on request/response bodies, headers, or status codes for integration and snapshot-style tests.

In all cases: start `host_bridge` on the host, pass its URL to your app or test harness, then use `HostBridgeClient` to `runCommand` or `fileOp` as needed.

## Requirements

- Dart SDK `^3.0.0`
- Supported platforms: Linux, macOS, Windows

## License

BSD 3-Clause. See [LICENSE](LICENSE).
