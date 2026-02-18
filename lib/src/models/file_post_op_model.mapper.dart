// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'file_post_op_model.dart';

class FilePostOpModelMapper extends ClassMapperBase<FilePostOpModel> {
  FilePostOpModelMapper._();

  static FilePostOpModelMapper? _instance;
  static FilePostOpModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilePostOpModelMapper._());
      FilePostOpModelWriteMapMapper.ensureInitialized();
      FilePostOpModelWriteStringMapper.ensureInitialized();
      FilePostOpModelDeleteMapper.ensureInitialized();
      FilePostOpModelReadMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilePostOpModel';

  static String _$path(FilePostOpModel v) => v.path;
  static const Field<FilePostOpModel, String> _f$path = Field('path', _$path);

  @override
  final MappableFields<FilePostOpModel> fields = const {#path: _f$path};

  static FilePostOpModel _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'FilePostOpModel',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FilePostOpModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilePostOpModel>(map);
  }

  static FilePostOpModel fromJson(String json) {
    return ensureInitialized().decodeJson<FilePostOpModel>(json);
  }
}

mixin FilePostOpModelMappable {
  String toJson();
  Map<String, dynamic> toMap();
  FilePostOpModelCopyWith<FilePostOpModel, FilePostOpModel, FilePostOpModel>
  get copyWith;
}

abstract class FilePostOpModelCopyWith<$R, $In extends FilePostOpModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? path});
  FilePostOpModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class FilePostOpModelWriteMapMapper
    extends SubClassMapperBase<FilePostOpModelWriteMap> {
  FilePostOpModelWriteMapMapper._();

  static FilePostOpModelWriteMapMapper? _instance;
  static FilePostOpModelWriteMapMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = FilePostOpModelWriteMapMapper._(),
      );
      FilePostOpModelMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FilePostOpModelWriteMap';

  static String _$path(FilePostOpModelWriteMap v) => v.path;
  static const Field<FilePostOpModelWriteMap, String> _f$path = Field(
    'path',
    _$path,
  );
  static Map<String, dynamic> _$content(FilePostOpModelWriteMap v) => v.content;
  static const Field<FilePostOpModelWriteMap, Map<String, dynamic>> _f$content =
      Field('content', _$content);

  @override
  final MappableFields<FilePostOpModelWriteMap> fields = const {
    #path: _f$path,
    #content: _f$content,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'write_map';
  @override
  late final ClassMapperBase superMapper =
      FilePostOpModelMapper.ensureInitialized();

  static FilePostOpModelWriteMap _instantiate(DecodingData data) {
    return FilePostOpModelWriteMap(
      path: data.dec(_f$path),
      content: data.dec(_f$content),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FilePostOpModelWriteMap fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilePostOpModelWriteMap>(map);
  }

  static FilePostOpModelWriteMap fromJson(String json) {
    return ensureInitialized().decodeJson<FilePostOpModelWriteMap>(json);
  }
}

mixin FilePostOpModelWriteMapMappable {
  String toJson() {
    return FilePostOpModelWriteMapMapper.ensureInitialized()
        .encodeJson<FilePostOpModelWriteMap>(this as FilePostOpModelWriteMap);
  }

  Map<String, dynamic> toMap() {
    return FilePostOpModelWriteMapMapper.ensureInitialized()
        .encodeMap<FilePostOpModelWriteMap>(this as FilePostOpModelWriteMap);
  }

  FilePostOpModelWriteMapCopyWith<
    FilePostOpModelWriteMap,
    FilePostOpModelWriteMap,
    FilePostOpModelWriteMap
  >
  get copyWith =>
      _FilePostOpModelWriteMapCopyWithImpl<
        FilePostOpModelWriteMap,
        FilePostOpModelWriteMap
      >(this as FilePostOpModelWriteMap, $identity, $identity);
  @override
  String toString() {
    return FilePostOpModelWriteMapMapper.ensureInitialized().stringifyValue(
      this as FilePostOpModelWriteMap,
    );
  }

  @override
  bool operator ==(Object other) {
    return FilePostOpModelWriteMapMapper.ensureInitialized().equalsValue(
      this as FilePostOpModelWriteMap,
      other,
    );
  }

  @override
  int get hashCode {
    return FilePostOpModelWriteMapMapper.ensureInitialized().hashValue(
      this as FilePostOpModelWriteMap,
    );
  }
}

extension FilePostOpModelWriteMapValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilePostOpModelWriteMap, $Out> {
  FilePostOpModelWriteMapCopyWith<$R, FilePostOpModelWriteMap, $Out>
  get $asFilePostOpModelWriteMap => $base.as(
    (v, t, t2) => _FilePostOpModelWriteMapCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FilePostOpModelWriteMapCopyWith<
  $R,
  $In extends FilePostOpModelWriteMap,
  $Out
>
    implements FilePostOpModelCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get content;
  @override
  $R call({String? path, Map<String, dynamic>? content});
  FilePostOpModelWriteMapCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FilePostOpModelWriteMapCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilePostOpModelWriteMap, $Out>
    implements
        FilePostOpModelWriteMapCopyWith<$R, FilePostOpModelWriteMap, $Out> {
  _FilePostOpModelWriteMapCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilePostOpModelWriteMap> $mapper =
      FilePostOpModelWriteMapMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get content => MapCopyWith(
    $value.content,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(content: v),
  );
  @override
  $R call({String? path, Map<String, dynamic>? content}) => $apply(
    FieldCopyWithData({
      if (path != null) #path: path,
      if (content != null) #content: content,
    }),
  );
  @override
  FilePostOpModelWriteMap $make(CopyWithData data) => FilePostOpModelWriteMap(
    path: data.get(#path, or: $value.path),
    content: data.get(#content, or: $value.content),
  );

  @override
  FilePostOpModelWriteMapCopyWith<$R2, FilePostOpModelWriteMap, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FilePostOpModelWriteMapCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FilePostOpModelWriteStringMapper
    extends SubClassMapperBase<FilePostOpModelWriteString> {
  FilePostOpModelWriteStringMapper._();

  static FilePostOpModelWriteStringMapper? _instance;
  static FilePostOpModelWriteStringMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = FilePostOpModelWriteStringMapper._(),
      );
      FilePostOpModelMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FilePostOpModelWriteString';

  static String _$path(FilePostOpModelWriteString v) => v.path;
  static const Field<FilePostOpModelWriteString, String> _f$path = Field(
    'path',
    _$path,
  );
  static String _$content(FilePostOpModelWriteString v) => v.content;
  static const Field<FilePostOpModelWriteString, String> _f$content = Field(
    'content',
    _$content,
  );

  @override
  final MappableFields<FilePostOpModelWriteString> fields = const {
    #path: _f$path,
    #content: _f$content,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'write_string';
  @override
  late final ClassMapperBase superMapper =
      FilePostOpModelMapper.ensureInitialized();

  static FilePostOpModelWriteString _instantiate(DecodingData data) {
    return FilePostOpModelWriteString(
      path: data.dec(_f$path),
      content: data.dec(_f$content),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FilePostOpModelWriteString fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilePostOpModelWriteString>(map);
  }

  static FilePostOpModelWriteString fromJson(String json) {
    return ensureInitialized().decodeJson<FilePostOpModelWriteString>(json);
  }
}

mixin FilePostOpModelWriteStringMappable {
  String toJson() {
    return FilePostOpModelWriteStringMapper.ensureInitialized()
        .encodeJson<FilePostOpModelWriteString>(
          this as FilePostOpModelWriteString,
        );
  }

  Map<String, dynamic> toMap() {
    return FilePostOpModelWriteStringMapper.ensureInitialized()
        .encodeMap<FilePostOpModelWriteString>(
          this as FilePostOpModelWriteString,
        );
  }

  FilePostOpModelWriteStringCopyWith<
    FilePostOpModelWriteString,
    FilePostOpModelWriteString,
    FilePostOpModelWriteString
  >
  get copyWith =>
      _FilePostOpModelWriteStringCopyWithImpl<
        FilePostOpModelWriteString,
        FilePostOpModelWriteString
      >(this as FilePostOpModelWriteString, $identity, $identity);
  @override
  String toString() {
    return FilePostOpModelWriteStringMapper.ensureInitialized().stringifyValue(
      this as FilePostOpModelWriteString,
    );
  }

  @override
  bool operator ==(Object other) {
    return FilePostOpModelWriteStringMapper.ensureInitialized().equalsValue(
      this as FilePostOpModelWriteString,
      other,
    );
  }

  @override
  int get hashCode {
    return FilePostOpModelWriteStringMapper.ensureInitialized().hashValue(
      this as FilePostOpModelWriteString,
    );
  }
}

extension FilePostOpModelWriteStringValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilePostOpModelWriteString, $Out> {
  FilePostOpModelWriteStringCopyWith<$R, FilePostOpModelWriteString, $Out>
  get $asFilePostOpModelWriteString => $base.as(
    (v, t, t2) => _FilePostOpModelWriteStringCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FilePostOpModelWriteStringCopyWith<
  $R,
  $In extends FilePostOpModelWriteString,
  $Out
>
    implements FilePostOpModelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path, String? content});
  FilePostOpModelWriteStringCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FilePostOpModelWriteStringCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilePostOpModelWriteString, $Out>
    implements
        FilePostOpModelWriteStringCopyWith<
          $R,
          FilePostOpModelWriteString,
          $Out
        > {
  _FilePostOpModelWriteStringCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilePostOpModelWriteString> $mapper =
      FilePostOpModelWriteStringMapper.ensureInitialized();
  @override
  $R call({String? path, String? content}) => $apply(
    FieldCopyWithData({
      if (path != null) #path: path,
      if (content != null) #content: content,
    }),
  );
  @override
  FilePostOpModelWriteString $make(CopyWithData data) =>
      FilePostOpModelWriteString(
        path: data.get(#path, or: $value.path),
        content: data.get(#content, or: $value.content),
      );

  @override
  FilePostOpModelWriteStringCopyWith<$R2, FilePostOpModelWriteString, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FilePostOpModelWriteStringCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FilePostOpModelDeleteMapper
    extends SubClassMapperBase<FilePostOpModelDelete> {
  FilePostOpModelDeleteMapper._();

  static FilePostOpModelDeleteMapper? _instance;
  static FilePostOpModelDeleteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilePostOpModelDeleteMapper._());
      FilePostOpModelMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FilePostOpModelDelete';

  static String _$path(FilePostOpModelDelete v) => v.path;
  static const Field<FilePostOpModelDelete, String> _f$path = Field(
    'path',
    _$path,
  );

  @override
  final MappableFields<FilePostOpModelDelete> fields = const {#path: _f$path};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'delete';
  @override
  late final ClassMapperBase superMapper =
      FilePostOpModelMapper.ensureInitialized();

  static FilePostOpModelDelete _instantiate(DecodingData data) {
    return FilePostOpModelDelete(path: data.dec(_f$path));
  }

  @override
  final Function instantiate = _instantiate;

  static FilePostOpModelDelete fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilePostOpModelDelete>(map);
  }

  static FilePostOpModelDelete fromJson(String json) {
    return ensureInitialized().decodeJson<FilePostOpModelDelete>(json);
  }
}

mixin FilePostOpModelDeleteMappable {
  String toJson() {
    return FilePostOpModelDeleteMapper.ensureInitialized()
        .encodeJson<FilePostOpModelDelete>(this as FilePostOpModelDelete);
  }

  Map<String, dynamic> toMap() {
    return FilePostOpModelDeleteMapper.ensureInitialized()
        .encodeMap<FilePostOpModelDelete>(this as FilePostOpModelDelete);
  }

  FilePostOpModelDeleteCopyWith<
    FilePostOpModelDelete,
    FilePostOpModelDelete,
    FilePostOpModelDelete
  >
  get copyWith =>
      _FilePostOpModelDeleteCopyWithImpl<
        FilePostOpModelDelete,
        FilePostOpModelDelete
      >(this as FilePostOpModelDelete, $identity, $identity);
  @override
  String toString() {
    return FilePostOpModelDeleteMapper.ensureInitialized().stringifyValue(
      this as FilePostOpModelDelete,
    );
  }

  @override
  bool operator ==(Object other) {
    return FilePostOpModelDeleteMapper.ensureInitialized().equalsValue(
      this as FilePostOpModelDelete,
      other,
    );
  }

  @override
  int get hashCode {
    return FilePostOpModelDeleteMapper.ensureInitialized().hashValue(
      this as FilePostOpModelDelete,
    );
  }
}

extension FilePostOpModelDeleteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilePostOpModelDelete, $Out> {
  FilePostOpModelDeleteCopyWith<$R, FilePostOpModelDelete, $Out>
  get $asFilePostOpModelDelete => $base.as(
    (v, t, t2) => _FilePostOpModelDeleteCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FilePostOpModelDeleteCopyWith<
  $R,
  $In extends FilePostOpModelDelete,
  $Out
>
    implements FilePostOpModelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path});
  FilePostOpModelDeleteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FilePostOpModelDeleteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilePostOpModelDelete, $Out>
    implements FilePostOpModelDeleteCopyWith<$R, FilePostOpModelDelete, $Out> {
  _FilePostOpModelDeleteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilePostOpModelDelete> $mapper =
      FilePostOpModelDeleteMapper.ensureInitialized();
  @override
  $R call({String? path}) =>
      $apply(FieldCopyWithData({if (path != null) #path: path}));
  @override
  FilePostOpModelDelete $make(CopyWithData data) =>
      FilePostOpModelDelete(path: data.get(#path, or: $value.path));

  @override
  FilePostOpModelDeleteCopyWith<$R2, FilePostOpModelDelete, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FilePostOpModelDeleteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FilePostOpModelReadMapper
    extends SubClassMapperBase<FilePostOpModelRead> {
  FilePostOpModelReadMapper._();

  static FilePostOpModelReadMapper? _instance;
  static FilePostOpModelReadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilePostOpModelReadMapper._());
      FilePostOpModelMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FilePostOpModelRead';

  static String _$path(FilePostOpModelRead v) => v.path;
  static const Field<FilePostOpModelRead, String> _f$path = Field(
    'path',
    _$path,
  );

  @override
  final MappableFields<FilePostOpModelRead> fields = const {#path: _f$path};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'read';
  @override
  late final ClassMapperBase superMapper =
      FilePostOpModelMapper.ensureInitialized();

  static FilePostOpModelRead _instantiate(DecodingData data) {
    return FilePostOpModelRead(path: data.dec(_f$path));
  }

  @override
  final Function instantiate = _instantiate;

  static FilePostOpModelRead fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilePostOpModelRead>(map);
  }

  static FilePostOpModelRead fromJson(String json) {
    return ensureInitialized().decodeJson<FilePostOpModelRead>(json);
  }
}

mixin FilePostOpModelReadMappable {
  String toJson() {
    return FilePostOpModelReadMapper.ensureInitialized()
        .encodeJson<FilePostOpModelRead>(this as FilePostOpModelRead);
  }

  Map<String, dynamic> toMap() {
    return FilePostOpModelReadMapper.ensureInitialized()
        .encodeMap<FilePostOpModelRead>(this as FilePostOpModelRead);
  }

  FilePostOpModelReadCopyWith<
    FilePostOpModelRead,
    FilePostOpModelRead,
    FilePostOpModelRead
  >
  get copyWith =>
      _FilePostOpModelReadCopyWithImpl<
        FilePostOpModelRead,
        FilePostOpModelRead
      >(this as FilePostOpModelRead, $identity, $identity);
  @override
  String toString() {
    return FilePostOpModelReadMapper.ensureInitialized().stringifyValue(
      this as FilePostOpModelRead,
    );
  }

  @override
  bool operator ==(Object other) {
    return FilePostOpModelReadMapper.ensureInitialized().equalsValue(
      this as FilePostOpModelRead,
      other,
    );
  }

  @override
  int get hashCode {
    return FilePostOpModelReadMapper.ensureInitialized().hashValue(
      this as FilePostOpModelRead,
    );
  }
}

extension FilePostOpModelReadValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilePostOpModelRead, $Out> {
  FilePostOpModelReadCopyWith<$R, FilePostOpModelRead, $Out>
  get $asFilePostOpModelRead => $base.as(
    (v, t, t2) => _FilePostOpModelReadCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FilePostOpModelReadCopyWith<
  $R,
  $In extends FilePostOpModelRead,
  $Out
>
    implements FilePostOpModelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path});
  FilePostOpModelReadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FilePostOpModelReadCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilePostOpModelRead, $Out>
    implements FilePostOpModelReadCopyWith<$R, FilePostOpModelRead, $Out> {
  _FilePostOpModelReadCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilePostOpModelRead> $mapper =
      FilePostOpModelReadMapper.ensureInitialized();
  @override
  $R call({String? path}) =>
      $apply(FieldCopyWithData({if (path != null) #path: path}));
  @override
  FilePostOpModelRead $make(CopyWithData data) =>
      FilePostOpModelRead(path: data.get(#path, or: $value.path));

  @override
  FilePostOpModelReadCopyWith<$R2, FilePostOpModelRead, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FilePostOpModelReadCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

