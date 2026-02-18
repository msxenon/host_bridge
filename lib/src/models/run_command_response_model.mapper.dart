// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'run_command_response_model.dart';

class RunCommandResponseModelMapper
    extends ClassMapperBase<RunCommandResponseModel> {
  RunCommandResponseModelMapper._();

  static RunCommandResponseModelMapper? _instance;
  static RunCommandResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = RunCommandResponseModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'RunCommandResponseModel';

  static String _$stdout(RunCommandResponseModel v) => v.stdout;
  static const Field<RunCommandResponseModel, String> _f$stdout = Field(
    'stdout',
    _$stdout,
  );
  static String _$stderr(RunCommandResponseModel v) => v.stderr;
  static const Field<RunCommandResponseModel, String> _f$stderr = Field(
    'stderr',
    _$stderr,
  );
  static int _$exitCode(RunCommandResponseModel v) => v.exitCode;
  static const Field<RunCommandResponseModel, int> _f$exitCode = Field(
    'exitCode',
    _$exitCode,
  );

  @override
  final MappableFields<RunCommandResponseModel> fields = const {
    #stdout: _f$stdout,
    #stderr: _f$stderr,
    #exitCode: _f$exitCode,
  };

  static RunCommandResponseModel _instantiate(DecodingData data) {
    return RunCommandResponseModel(
      stdout: data.dec(_f$stdout),
      stderr: data.dec(_f$stderr),
      exitCode: data.dec(_f$exitCode),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RunCommandResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RunCommandResponseModel>(map);
  }

  static RunCommandResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<RunCommandResponseModel>(json);
  }
}

mixin RunCommandResponseModelMappable {
  String toJson() {
    return RunCommandResponseModelMapper.ensureInitialized()
        .encodeJson<RunCommandResponseModel>(this as RunCommandResponseModel);
  }

  Map<String, dynamic> toMap() {
    return RunCommandResponseModelMapper.ensureInitialized()
        .encodeMap<RunCommandResponseModel>(this as RunCommandResponseModel);
  }

  RunCommandResponseModelCopyWith<
    RunCommandResponseModel,
    RunCommandResponseModel,
    RunCommandResponseModel
  >
  get copyWith =>
      _RunCommandResponseModelCopyWithImpl<
        RunCommandResponseModel,
        RunCommandResponseModel
      >(this as RunCommandResponseModel, $identity, $identity);
  @override
  String toString() {
    return RunCommandResponseModelMapper.ensureInitialized().stringifyValue(
      this as RunCommandResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return RunCommandResponseModelMapper.ensureInitialized().equalsValue(
      this as RunCommandResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return RunCommandResponseModelMapper.ensureInitialized().hashValue(
      this as RunCommandResponseModel,
    );
  }
}

extension RunCommandResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RunCommandResponseModel, $Out> {
  RunCommandResponseModelCopyWith<$R, RunCommandResponseModel, $Out>
  get $asRunCommandResponseModel => $base.as(
    (v, t, t2) => _RunCommandResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RunCommandResponseModelCopyWith<
  $R,
  $In extends RunCommandResponseModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? stdout, String? stderr, int? exitCode});
  RunCommandResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RunCommandResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RunCommandResponseModel, $Out>
    implements
        RunCommandResponseModelCopyWith<$R, RunCommandResponseModel, $Out> {
  _RunCommandResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RunCommandResponseModel> $mapper =
      RunCommandResponseModelMapper.ensureInitialized();
  @override
  $R call({String? stdout, String? stderr, int? exitCode}) => $apply(
    FieldCopyWithData({
      if (stdout != null) #stdout: stdout,
      if (stderr != null) #stderr: stderr,
      if (exitCode != null) #exitCode: exitCode,
    }),
  );
  @override
  RunCommandResponseModel $make(CopyWithData data) => RunCommandResponseModel(
    stdout: data.get(#stdout, or: $value.stdout),
    stderr: data.get(#stderr, or: $value.stderr),
    exitCode: data.get(#exitCode, or: $value.exitCode),
  );

  @override
  RunCommandResponseModelCopyWith<$R2, RunCommandResponseModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RunCommandResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

