// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'file_response_model.dart';

class FileResponseModelMapper extends ClassMapperBase<FileResponseModel> {
  FileResponseModelMapper._();

  static FileResponseModelMapper? _instance;
  static FileResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileResponseModelMapper._());
      FileNotFoundResponseMapper.ensureInitialized();
      StringFileResponseMapper.ensureInitialized();
      VoidFileResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FileResponseModel';

  @override
  final MappableFields<FileResponseModel> fields = const {};
  @override
  final bool ignoreNull = true;

  static FileResponseModel _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'FileResponseModel',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FileResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileResponseModel>(map);
  }

  static FileResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<FileResponseModel>(json);
  }
}

mixin FileResponseModelMappable {
  String toJson();
  Map<String, dynamic> toMap();
  FileResponseModelCopyWith<
    FileResponseModel,
    FileResponseModel,
    FileResponseModel
  >
  get copyWith;
}

abstract class FileResponseModelCopyWith<
  $R,
  $In extends FileResponseModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  FileResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class FileNotFoundResponseMapper
    extends SubClassMapperBase<FileNotFoundResponse> {
  FileNotFoundResponseMapper._();

  static FileNotFoundResponseMapper? _instance;
  static FileNotFoundResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileNotFoundResponseMapper._());
      FileResponseModelMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FileNotFoundResponse';

  @override
  final MappableFields<FileNotFoundResponse> fields = const {};
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'not_found';
  @override
  late final ClassMapperBase superMapper =
      FileResponseModelMapper.ensureInitialized();

  static FileNotFoundResponse _instantiate(DecodingData data) {
    return FileNotFoundResponse();
  }

  @override
  final Function instantiate = _instantiate;

  static FileNotFoundResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileNotFoundResponse>(map);
  }

  static FileNotFoundResponse fromJson(String json) {
    return ensureInitialized().decodeJson<FileNotFoundResponse>(json);
  }
}

mixin FileNotFoundResponseMappable {
  String toJson() {
    return FileNotFoundResponseMapper.ensureInitialized()
        .encodeJson<FileNotFoundResponse>(this as FileNotFoundResponse);
  }

  Map<String, dynamic> toMap() {
    return FileNotFoundResponseMapper.ensureInitialized()
        .encodeMap<FileNotFoundResponse>(this as FileNotFoundResponse);
  }

  FileNotFoundResponseCopyWith<
    FileNotFoundResponse,
    FileNotFoundResponse,
    FileNotFoundResponse
  >
  get copyWith =>
      _FileNotFoundResponseCopyWithImpl<
        FileNotFoundResponse,
        FileNotFoundResponse
      >(this as FileNotFoundResponse, $identity, $identity);
  @override
  String toString() {
    return FileNotFoundResponseMapper.ensureInitialized().stringifyValue(
      this as FileNotFoundResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return FileNotFoundResponseMapper.ensureInitialized().equalsValue(
      this as FileNotFoundResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return FileNotFoundResponseMapper.ensureInitialized().hashValue(
      this as FileNotFoundResponse,
    );
  }
}

extension FileNotFoundResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FileNotFoundResponse, $Out> {
  FileNotFoundResponseCopyWith<$R, FileNotFoundResponse, $Out>
  get $asFileNotFoundResponse => $base.as(
    (v, t, t2) => _FileNotFoundResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FileNotFoundResponseCopyWith<
  $R,
  $In extends FileNotFoundResponse,
  $Out
>
    implements FileResponseModelCopyWith<$R, $In, $Out> {
  @override
  $R call();
  FileNotFoundResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FileNotFoundResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileNotFoundResponse, $Out>
    implements FileNotFoundResponseCopyWith<$R, FileNotFoundResponse, $Out> {
  _FileNotFoundResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileNotFoundResponse> $mapper =
      FileNotFoundResponseMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  FileNotFoundResponse $make(CopyWithData data) => FileNotFoundResponse();

  @override
  FileNotFoundResponseCopyWith<$R2, FileNotFoundResponse, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FileNotFoundResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StringFileResponseMapper extends SubClassMapperBase<StringFileResponse> {
  StringFileResponseMapper._();

  static StringFileResponseMapper? _instance;
  static StringFileResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StringFileResponseMapper._());
      FileResponseModelMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'StringFileResponse';

  static String _$response(StringFileResponse v) => v.response;
  static const Field<StringFileResponse, String> _f$response = Field(
    'response',
    _$response,
  );

  @override
  final MappableFields<StringFileResponse> fields = const {
    #response: _f$response,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'string';
  @override
  late final ClassMapperBase superMapper =
      FileResponseModelMapper.ensureInitialized();

  static StringFileResponse _instantiate(DecodingData data) {
    return StringFileResponse(response: data.dec(_f$response));
  }

  @override
  final Function instantiate = _instantiate;

  static StringFileResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StringFileResponse>(map);
  }

  static StringFileResponse fromJson(String json) {
    return ensureInitialized().decodeJson<StringFileResponse>(json);
  }
}

mixin StringFileResponseMappable {
  String toJson() {
    return StringFileResponseMapper.ensureInitialized()
        .encodeJson<StringFileResponse>(this as StringFileResponse);
  }

  Map<String, dynamic> toMap() {
    return StringFileResponseMapper.ensureInitialized()
        .encodeMap<StringFileResponse>(this as StringFileResponse);
  }

  StringFileResponseCopyWith<
    StringFileResponse,
    StringFileResponse,
    StringFileResponse
  >
  get copyWith =>
      _StringFileResponseCopyWithImpl<StringFileResponse, StringFileResponse>(
        this as StringFileResponse,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return StringFileResponseMapper.ensureInitialized().stringifyValue(
      this as StringFileResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return StringFileResponseMapper.ensureInitialized().equalsValue(
      this as StringFileResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return StringFileResponseMapper.ensureInitialized().hashValue(
      this as StringFileResponse,
    );
  }
}

extension StringFileResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StringFileResponse, $Out> {
  StringFileResponseCopyWith<$R, StringFileResponse, $Out>
  get $asStringFileResponse => $base.as(
    (v, t, t2) => _StringFileResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class StringFileResponseCopyWith<
  $R,
  $In extends StringFileResponse,
  $Out
>
    implements FileResponseModelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? response});
  StringFileResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _StringFileResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StringFileResponse, $Out>
    implements StringFileResponseCopyWith<$R, StringFileResponse, $Out> {
  _StringFileResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StringFileResponse> $mapper =
      StringFileResponseMapper.ensureInitialized();
  @override
  $R call({String? response}) =>
      $apply(FieldCopyWithData({if (response != null) #response: response}));
  @override
  StringFileResponse $make(CopyWithData data) =>
      StringFileResponse(response: data.get(#response, or: $value.response));

  @override
  StringFileResponseCopyWith<$R2, StringFileResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _StringFileResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class VoidFileResponseMapper extends SubClassMapperBase<VoidFileResponse> {
  VoidFileResponseMapper._();

  static VoidFileResponseMapper? _instance;
  static VoidFileResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VoidFileResponseMapper._());
      FileResponseModelMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'VoidFileResponse';

  @override
  final MappableFields<VoidFileResponse> fields = const {};
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'void';
  @override
  late final ClassMapperBase superMapper =
      FileResponseModelMapper.ensureInitialized();

  static VoidFileResponse _instantiate(DecodingData data) {
    return VoidFileResponse();
  }

  @override
  final Function instantiate = _instantiate;

  static VoidFileResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VoidFileResponse>(map);
  }

  static VoidFileResponse fromJson(String json) {
    return ensureInitialized().decodeJson<VoidFileResponse>(json);
  }
}

mixin VoidFileResponseMappable {
  String toJson() {
    return VoidFileResponseMapper.ensureInitialized()
        .encodeJson<VoidFileResponse>(this as VoidFileResponse);
  }

  Map<String, dynamic> toMap() {
    return VoidFileResponseMapper.ensureInitialized()
        .encodeMap<VoidFileResponse>(this as VoidFileResponse);
  }

  VoidFileResponseCopyWith<VoidFileResponse, VoidFileResponse, VoidFileResponse>
  get copyWith =>
      _VoidFileResponseCopyWithImpl<VoidFileResponse, VoidFileResponse>(
        this as VoidFileResponse,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return VoidFileResponseMapper.ensureInitialized().stringifyValue(
      this as VoidFileResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return VoidFileResponseMapper.ensureInitialized().equalsValue(
      this as VoidFileResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return VoidFileResponseMapper.ensureInitialized().hashValue(
      this as VoidFileResponse,
    );
  }
}

extension VoidFileResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VoidFileResponse, $Out> {
  VoidFileResponseCopyWith<$R, VoidFileResponse, $Out>
  get $asVoidFileResponse =>
      $base.as((v, t, t2) => _VoidFileResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class VoidFileResponseCopyWith<$R, $In extends VoidFileResponse, $Out>
    implements FileResponseModelCopyWith<$R, $In, $Out> {
  @override
  $R call();
  VoidFileResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _VoidFileResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VoidFileResponse, $Out>
    implements VoidFileResponseCopyWith<$R, VoidFileResponse, $Out> {
  _VoidFileResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VoidFileResponse> $mapper =
      VoidFileResponseMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  VoidFileResponse $make(CopyWithData data) => VoidFileResponse();

  @override
  VoidFileResponseCopyWith<$R2, VoidFileResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _VoidFileResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

