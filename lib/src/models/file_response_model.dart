import 'package:dart_mappable/dart_mappable.dart';
part 'file_response_model.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorKey: 'type')
sealed class FileResponseModel with FileResponseModelMappable {
  const FileResponseModel();
}

@MappableClass(ignoreNull: true, discriminatorValue: 'not_found')
class FileNotFoundResponse extends FileResponseModel
    with FileNotFoundResponseMappable {
  const FileNotFoundResponse();
}

@MappableClass(ignoreNull: true, discriminatorValue: 'string')
class StringFileResponse extends FileResponseModel
    with StringFileResponseMappable {
  final String response;
  const StringFileResponse({required this.response});
}

@MappableClass(ignoreNull: true, discriminatorValue: 'void')
class VoidFileResponse extends FileResponseModel with VoidFileResponseMappable {
  const VoidFileResponse();
}
