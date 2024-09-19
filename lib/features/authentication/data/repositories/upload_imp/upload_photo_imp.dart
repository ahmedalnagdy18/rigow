import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_upload/api_upload_photo.dart';
import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_input.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:rigow/features/authentication/domain/repositories/upload_files_repository.dart';

class UploadFileRepositoryImp implements UploadFileRepository {
  final GraphQLClient graphQLClient;

  UploadFileRepositoryImp({required this.graphQLClient});

  @override
  Future<String> uploadfile(UploadFiledInput input) async {
    final MultipartFile file = await MultipartFile.fromPath('', input.file,
        contentType: getMimeType(input.file));

    final result = await graphQLClient
        .mutate(MutationOptions(document: gql(uploadFilee), variables: {
      "file": file,
      "model": input.model,
    }));
    //ApiUploadFileInput.frominput(input).toJson()
    if (result.data == null) {
      throw Exception();
    }
    final response = ApiUploadFile.fromJson(result.data!);
    if (response.uploadFile != null && response.uploadFile?.code == 200) {
      return response.uploadFile?.data ?? "";
    } else {
      throw FormatException(response.uploadFile?.message ?? "");
    }
  }

  MediaType getMimeType(String file) {
    final mime = lookupMimeType(file);
    if (mime != null) {
      final splits = mime.split("/");
      final type = splits.firstOrNull ?? "";
      final subtype = splits.lastOrNull ?? "";
      return MediaType(type, subtype);
    } else {
      return MediaType("", "");
    }
  }
}
