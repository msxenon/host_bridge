import 'package:dart_mappable/dart_mappable.dart';
part 'run_command_request_model.mapper.dart';

@MappableClass()
class RunCommandRequestModel with RunCommandRequestModelMappable {
  final String command;
  final String? workingDirectory;
  final int? timeoutSeconds;

  const RunCommandRequestModel({
    required this.command,
    this.workingDirectory,
    this.timeoutSeconds,
  });
}
