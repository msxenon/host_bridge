import 'dart:async';

import 'package:host_bridge/src/server.dart';

Future main(List<String> args) async {
  final server = Server();
  await server.run();
}
