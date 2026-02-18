import 'package:dart_mappable/dart_mappable.dart';
part 'file_post_op_model.mapper.dart';

@MappableClass(discriminatorKey: 'type')
sealed class FilePostOpModel with FilePostOpModelMappable {
  final String path;
  const FilePostOpModel({required this.path});
}

@MappableClass(discriminatorValue: 'write_map')
class FilePostOpModelWriteMap extends FilePostOpModel
    with FilePostOpModelWriteMapMappable {
  final Map<String, dynamic> content;
  FilePostOpModelWriteMap({required super.path, required this.content});
}

@MappableClass(discriminatorValue: 'write_string')
class FilePostOpModelWriteString extends FilePostOpModel
    with FilePostOpModelWriteStringMappable {
  final String content;
  FilePostOpModelWriteString({required super.path, required this.content});
}

@MappableClass(discriminatorValue: 'delete')
class FilePostOpModelDelete extends FilePostOpModel
    with FilePostOpModelDeleteMappable {
  FilePostOpModelDelete({required super.path});
}

@MappableClass(discriminatorValue: 'read')
class FilePostOpModelRead extends FilePostOpModel
    with FilePostOpModelReadMappable {
  FilePostOpModelRead({required super.path});
}
