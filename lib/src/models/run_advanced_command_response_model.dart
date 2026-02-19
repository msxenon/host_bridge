import 'package:dart_mappable/dart_mappable.dart';
part 'run_advanced_command_response_model.mapper.dart';

@MappableClass(discriminatorKey: 'type')
sealed class RunAdvancedCommandResponseModel
    with RunAdvancedCommandResponseModelMappable {
  const RunAdvancedCommandResponseModel();
}

@MappableClass(discriminatorValue: 'error')
class RunAdvancedCommandResponseModelError
    extends RunAdvancedCommandResponseModel
    with RunAdvancedCommandResponseModelErrorMappable {
  final String stderr;
  final int exitCode;
  const RunAdvancedCommandResponseModelError(
      {required this.stderr, required this.exitCode});
}

@MappableClass(discriminatorValue: 'data')
class RunAdvancedCommandResponseModelData
    extends RunAdvancedCommandResponseModel
    with RunAdvancedCommandResponseModelDataMappable {
  final int exitCode;
  final String stdout;
  final int pid;
  const RunAdvancedCommandResponseModelData({
    required this.exitCode,
    required this.stdout,
    required this.pid,
  });
}
