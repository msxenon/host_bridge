// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'run_command_request_model.dart';

class RunCommandRequestModelMapper
    extends ClassMapperBase<RunCommandRequestModel> {
  RunCommandRequestModelMapper._();

  static RunCommandRequestModelMapper? _instance;
  static RunCommandRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RunCommandRequestModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RunCommandRequestModel';

  static String _$command(RunCommandRequestModel v) => v.command;
  static const Field<RunCommandRequestModel, String> _f$command = Field(
    'command',
    _$command,
  );
  static String? _$workingDirectory(RunCommandRequestModel v) =>
      v.workingDirectory;
  static const Field<RunCommandRequestModel, String> _f$workingDirectory =
      Field('workingDirectory', _$workingDirectory, opt: true);
  static int? _$timeoutSeconds(RunCommandRequestModel v) => v.timeoutSeconds;
  static const Field<RunCommandRequestModel, int> _f$timeoutSeconds = Field(
    'timeoutSeconds',
    _$timeoutSeconds,
    opt: true,
  );

  @override
  final MappableFields<RunCommandRequestModel> fields = const {
    #command: _f$command,
    #workingDirectory: _f$workingDirectory,
    #timeoutSeconds: _f$timeoutSeconds,
  };

  static RunCommandRequestModel _instantiate(DecodingData data) {
    return RunCommandRequestModel(
      command: data.dec(_f$command),
      workingDirectory: data.dec(_f$workingDirectory),
      timeoutSeconds: data.dec(_f$timeoutSeconds),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RunCommandRequestModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RunCommandRequestModel>(map);
  }

  static RunCommandRequestModel fromJson(String json) {
    return ensureInitialized().decodeJson<RunCommandRequestModel>(json);
  }
}

mixin RunCommandRequestModelMappable {
  String toJson() {
    return RunCommandRequestModelMapper.ensureInitialized()
        .encodeJson<RunCommandRequestModel>(this as RunCommandRequestModel);
  }

  Map<String, dynamic> toMap() {
    return RunCommandRequestModelMapper.ensureInitialized()
        .encodeMap<RunCommandRequestModel>(this as RunCommandRequestModel);
  }

  RunCommandRequestModelCopyWith<
    RunCommandRequestModel,
    RunCommandRequestModel,
    RunCommandRequestModel
  >
  get copyWith =>
      _RunCommandRequestModelCopyWithImpl<
        RunCommandRequestModel,
        RunCommandRequestModel
      >(this as RunCommandRequestModel, $identity, $identity);
  @override
  String toString() {
    return RunCommandRequestModelMapper.ensureInitialized().stringifyValue(
      this as RunCommandRequestModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return RunCommandRequestModelMapper.ensureInitialized().equalsValue(
      this as RunCommandRequestModel,
      other,
    );
  }

  @override
  int get hashCode {
    return RunCommandRequestModelMapper.ensureInitialized().hashValue(
      this as RunCommandRequestModel,
    );
  }
}

extension RunCommandRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RunCommandRequestModel, $Out> {
  RunCommandRequestModelCopyWith<$R, RunCommandRequestModel, $Out>
  get $asRunCommandRequestModel => $base.as(
    (v, t, t2) => _RunCommandRequestModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RunCommandRequestModelCopyWith<
  $R,
  $In extends RunCommandRequestModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? command, String? workingDirectory, int? timeoutSeconds});
  RunCommandRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RunCommandRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RunCommandRequestModel, $Out>
    implements
        RunCommandRequestModelCopyWith<$R, RunCommandRequestModel, $Out> {
  _RunCommandRequestModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RunCommandRequestModel> $mapper =
      RunCommandRequestModelMapper.ensureInitialized();
  @override
  $R call({
    String? command,
    Object? workingDirectory = $none,
    Object? timeoutSeconds = $none,
  }) => $apply(
    FieldCopyWithData({
      if (command != null) #command: command,
      if (workingDirectory != $none) #workingDirectory: workingDirectory,
      if (timeoutSeconds != $none) #timeoutSeconds: timeoutSeconds,
    }),
  );
  @override
  RunCommandRequestModel $make(CopyWithData data) => RunCommandRequestModel(
    command: data.get(#command, or: $value.command),
    workingDirectory: data.get(#workingDirectory, or: $value.workingDirectory),
    timeoutSeconds: data.get(#timeoutSeconds, or: $value.timeoutSeconds),
  );

  @override
  RunCommandRequestModelCopyWith<$R2, RunCommandRequestModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RunCommandRequestModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

