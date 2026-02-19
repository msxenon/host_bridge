import 'package:flutter/material.dart';

import 'package:host_bridge/host_bridge.dart';

import 'file_ops_screen.dart';
import 'command_line_screen.dart';

void main() {
  final url = const String.fromEnvironment('HOST_BRIDGE_URL', defaultValue: '');
  if (url.isNotEmpty) {
    HostBridgeClient(url).ping();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Host bridge example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Host bridge example'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'File ops'),
              Tab(text: 'Command line'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [FileOpsScreen(), CommandLineScreen()],
        ),
      ),
    );
  }
}
