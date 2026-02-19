// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'run_advanced_command_response_model.dart';

class RunAdvancedCommandResponseModelMapper
    extends ClassMapperBase<RunAdvancedCommandResponseModel> {
  RunAdvancedCommandResponseModelMapper._();

  static RunAdvancedCommandResponseModelMapper? _instance;
  static RunAdvancedCommandResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = RunAdvancedCommandResponseModelMapper._(),
      );
      RunAdvancedCommandResponseModelErrorMapper.ensureInitialized();
      RunAdvancedCommandResponseModelDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RunAdvancedCommandResponseModel';

  @override
  final MappableFields<RunAdvancedCommandResponseModel> fields = const {};

  static RunAdvancedCommandResponseModel _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'RunAdvancedCommandResponseModel',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RunAdvancedCommandResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RunAdvancedCommandResponseModel>(map);
  }

  static RunAdvancedCommandResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<RunAdvancedCommandResponseModel>(
      json,
    );
  }
}

mixin RunAdvancedCommandResponseModelMappable {
  String toJson();
  Map<String, dynamic> toMap();
  RunAdvancedCommandResponseModelCopyWith<
    RunAdvancedCommandResponseModel,
    RunAdvancedCommandResponseModel,
    RunAdvancedCommandResponseModel
  >
  get copyWith;
}

abstract class RunAdvancedCommandResponseModelCopyWith<
  $R,
  $In extends RunAdvancedCommandResponseModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  RunAdvancedCommandResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class RunAdvancedCommandResponseModelErrorMapper
    extends SubClassMapperBase<RunAdvancedCommandResponseModelError> {
  RunAdvancedCommandResponseModelErrorMapper._();

  static RunAdvancedCommandResponseModelErrorMapper? _instance;
  static RunAdvancedCommandResponseModelErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = RunAdvancedCommandResponseModelErrorMapper._(),
      );
      RunAdvancedCommandResponseModelMapper.ensureInitialized().addSubMapper(
        _instance!,
      );
    }
    return _instance!;
  }

  @override
  final String id = 'RunAdvancedCommandResponseModelError';

  static String _$stderr(RunAdvancedCommandResponseModelError v) => v.stderr;
  static const Field<RunAdvancedCommandResponseModelError, String> _f$stderr =
      Field('stderr', _$stderr);
  static int _$exitCode(RunAdvancedCommandResponseModelError v) => v.exitCode;
  static const Field<RunAdvancedCommandResponseModelError, int> _f$exitCode =
      Field('exitCode', _$exitCode);

  @override
  final MappableFields<RunAdvancedCommandResponseModelError> fields = const {
    #stderr: _f$stderr,
    #exitCode: _f$exitCode,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'error';
  @override
  late final ClassMapperBase superMapper =
      RunAdvancedCommandResponseModelMapper.ensureInitialized();

  static RunAdvancedCommandResponseModelError _instantiate(DecodingData data) {
    return RunAdvancedCommandResponseModelError(
      stderr: data.dec(_f$stderr),
      exitCode: data.dec(_f$exitCode),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RunAdvancedCommandResponseModelError fromMap(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized().decodeMap<RunAdvancedCommandResponseModelError>(
      map,
    );
  }

  static RunAdvancedCommandResponseModelError fromJson(String json) {
    return ensureInitialized().decodeJson<RunAdvancedCommandResponseModelError>(
      json,
    );
  }
}

mixin RunAdvancedCommandResponseModelErrorMappable {
  String toJson() {
    return RunAdvancedCommandResponseModelErrorMapper.ensureInitialized()
        .encodeJson<RunAdvancedCommandResponseModelError>(
          this as RunAdvancedCommandResponseModelError,
        );
  }

  Map<String, dynamic> toMap() {
    return RunAdvancedCommandResponseModelErrorMapper.ensureInitialized()
        .encodeMap<RunAdvancedCommandResponseModelError>(
          this as RunAdvancedCommandResponseModelError,
        );
  }

  RunAdvancedCommandResponseModelErrorCopyWith<
    RunAdvancedCommandResponseModelError,
    RunAdvancedCommandResponseModelError,
    RunAdvancedCommandResponseModelError
  >
  get copyWith =>
      _RunAdvancedCommandResponseModelErrorCopyWithImpl<
        RunAdvancedCommandResponseModelError,
        RunAdvancedCommandResponseModelError
      >(this as RunAdvancedCommandResponseModelError, $identity, $identity);
  @override
  String toString() {
    return RunAdvancedCommandResponseModelErrorMapper.ensureInitialized()
        .stringifyValue(this as RunAdvancedCommandResponseModelError);
  }

  @override
  bool operator ==(Object other) {
    return RunAdvancedCommandResponseModelErrorMapper.ensureInitialized()
        .equalsValue(this as RunAdvancedCommandResponseModelError, other);
  }

  @override
  int get hashCode {
    return RunAdvancedCommandResponseModelErrorMapper.ensureInitialized()
        .hashValue(this as RunAdvancedCommandResponseModelError);
  }
}

extension RunAdvancedCommandResponseModelErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RunAdvancedCommandResponseModelError, $Out> {
  RunAdvancedCommandResponseModelErrorCopyWith<
    $R,
    RunAdvancedCommandResponseModelError,
    $Out
  >
  get $asRunAdvancedCommandResponseModelError => $base.as(
    (v, t, t2) =>
        _RunAdvancedCommandResponseModelErrorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RunAdvancedCommandResponseModelErrorCopyWith<
  $R,
  $In extends RunAdvancedCommandResponseModelError,
  $Out
>
    implements RunAdvancedCommandResponseModelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? stderr, int? exitCode});
  RunAdvancedCommandResponseModelErrorCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RunAdvancedCommandResponseModelErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RunAdvancedCommandResponseModelError, $Out>
    implements
        RunAdvancedCommandResponseModelErrorCopyWith<
          $R,
          RunAdvancedCommandResponseModelError,
          $Out
        > {
  _RunAdvancedCommandResponseModelErrorCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<RunAdvancedCommandResponseModelError> $mapper =
      RunAdvancedCommandResponseModelErrorMapper.ensureInitialized();
  @override
  $R call({String? stderr, int? exitCode}) => $apply(
    FieldCopyWithData({
      if (stderr != null) #stderr: stderr,
      if (exitCode != null) #exitCode: exitCode,
    }),
  );
  @override
  RunAdvancedCommandResponseModelError $make(CopyWithData data) =>
      RunAdvancedCommandResponseModelError(
        stderr: data.get(#stderr, or: $value.stderr),
        exitCode: data.get(#exitCode, or: $value.exitCode),
      );

  @override
  RunAdvancedCommandResponseModelErrorCopyWith<
    $R2,
    RunAdvancedCommandResponseModelError,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RunAdvancedCommandResponseModelErrorCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

class RunAdvancedCommandResponseModelDataMapper
    extends SubClassMapperBase<RunAdvancedCommandResponseModelData> {
  RunAdvancedCommandResponseModelDataMapper._();

  static RunAdvancedCommandResponseModelDataMapper? _instance;
  static RunAdvancedCommandResponseModelDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = RunAdvancedCommandResponseModelDataMapper._(),
      );
      RunAdvancedCommandResponseModelMapper.ensureInitialized().addSubMapper(
        _instance!,
      );
    }
    return _instance!;
  }

  @override
  final String id = 'RunAdvancedCommandResponseModelData';

  static int _$exitCode(RunAdvancedCommandResponseModelData v) => v.exitCode;
  static const Field<RunAdvancedCommandResponseModelData, int> _f$exitCode =
      Field('exitCode', _$exitCode);
  static String _$stdout(RunAdvancedCommandResponseModelData v) => v.stdout;
  static const Field<RunAdvancedCommandResponseModelData, String> _f$stdout =
      Field('stdout', _$stdout);
  static int _$pid(RunAdvancedCommandResponseModelData v) => v.pid;
  static const Field<RunAdvancedCommandResponseModelData, int> _f$pid = Field(
    'pid',
    _$pid,
  );

  @override
  final MappableFields<RunAdvancedCommandResponseModelData> fields = const {
    #exitCode: _f$exitCode,
    #stdout: _f$stdout,
    #pid: _f$pid,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'data';
  @override
  late final ClassMapperBase superMapper =
      RunAdvancedCommandResponseModelMapper.ensureInitialized();

  static RunAdvancedCommandResponseModelData _instantiate(DecodingData data) {
    return RunAdvancedCommandResponseModelData(
      exitCode: data.dec(_f$exitCode),
      stdout: data.dec(_f$stdout),
      pid: data.dec(_f$pid),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RunAdvancedCommandResponseModelData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RunAdvancedCommandResponseModelData>(
      map,
    );
  }

  static RunAdvancedCommandResponseModelData fromJson(String json) {
    return ensureInitialized().decodeJson<RunAdvancedCommandResponseModelData>(
      json,
    );
  }
}

mixin RunAdvancedCommandResponseModelDataMappable {
  String toJson() {
    return RunAdvancedCommandResponseModelDataMapper.ensureInitialized()
        .encodeJson<RunAdvancedCommandResponseModelData>(
          this as RunAdvancedCommandResponseModelData,
        );
  }

  Map<String, dynamic> toMap() {
    return RunAdvancedCommandResponseModelDataMapper.ensureInitialized()
        .encodeMap<RunAdvancedCommandResponseModelData>(
          this as RunAdvancedCommandResponseModelData,
        );
  }

  RunAdvancedCommandResponseModelDataCopyWith<
    RunAdvancedCommandResponseModelData,
    RunAdvancedCommandResponseModelData,
    RunAdvancedCommandResponseModelData
  >
  get copyWith =>
      _RunAdvancedCommandResponseModelDataCopyWithImpl<
        RunAdvancedCommandResponseModelData,
        RunAdvancedCommandResponseModelData
      >(this as RunAdvancedCommandResponseModelData, $identity, $identity);
  @override
  String toString() {
    return RunAdvancedCommandResponseModelDataMapper.ensureInitialized()
        .stringifyValue(this as RunAdvancedCommandResponseModelData);
  }

  @override
  bool operator ==(Object other) {
    return RunAdvancedCommandResponseModelDataMapper.ensureInitialized()
        .equalsValue(this as RunAdvancedCommandResponseModelData, other);
  }

  @override
  int get hashCode {
    return RunAdvancedCommandResponseModelDataMapper.ensureInitialized()
        .hashValue(this as RunAdvancedCommandResponseModelData);
  }
}

extension RunAdvancedCommandResponseModelDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RunAdvancedCommandResponseModelData, $Out> {
  RunAdvancedCommandResponseModelDataCopyWith<
    $R,
    RunAdvancedCommandResponseModelData,
    $Out
  >
  get $asRunAdvancedCommandResponseModelData => $base.as(
    (v, t, t2) =>
        _RunAdvancedCommandResponseModelDataCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RunAdvancedCommandResponseModelDataCopyWith<
  $R,
  $In extends RunAdvancedCommandResponseModelData,
  $Out
>
    implements RunAdvancedCommandResponseModelCopyWith<$R, $In, $Out> {
  @override
  $R call({int? exitCode, String? stdout, int? pid});
  RunAdvancedCommandResponseModelDataCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RunAdvancedCommandResponseModelDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RunAdvancedCommandResponseModelData, $Out>
    implements
        RunAdvancedCommandResponseModelDataCopyWith<
          $R,
          RunAdvancedCommandResponseModelData,
          $Out
        > {
  _RunAdvancedCommandResponseModelDataCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<RunAdvancedCommandResponseModelData> $mapper =
      RunAdvancedCommandResponseModelDataMapper.ensureInitialized();
  @override
  $R call({int? exitCode, String? stdout, int? pid}) => $apply(
    FieldCopyWithData({
      if (exitCode != null) #exitCode: exitCode,
      if (stdout != null) #stdout: stdout,
      if (pid != null) #pid: pid,
    }),
  );
  @override
  RunAdvancedCommandResponseModelData $make(CopyWithData data) =>
      RunAdvancedCommandResponseModelData(
        exitCode: data.get(#exitCode, or: $value.exitCode),
        stdout: data.get(#stdout, or: $value.stdout),
        pid: data.get(#pid, or: $value.pid),
      );

  @override
  RunAdvancedCommandResponseModelDataCopyWith<
    $R2,
    RunAdvancedCommandResponseModelData,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RunAdvancedCommandResponseModelDataCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

