import 'package:dart_mappable/dart_mappable.dart';
part 'run_command_response_model.mapper.dart';

@MappableClass()
class RunCommandResponseModel with RunCommandResponseModelMappable {
  final String stdout;
  final String stderr;
  final int exitCode;

  const RunCommandResponseModel({
    required this.stdout,
    required this.stderr,
    required this.exitCode,
  });
}
