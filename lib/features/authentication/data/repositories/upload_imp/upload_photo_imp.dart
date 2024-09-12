import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_upload/api_upload_photo.dart';
import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class UploadFileRepositoryImp implements UploadFileRepository {
  final GraphQLClient graphQLClient;

  UploadFileRepositoryImp({required this.graphQLClient});

  @override
  Future<void> uploadfile(UploadFiledEntity uploadFiledEntity) async {
    final result = await graphQLClient.mutate(MutationOptions(
        document: gql(uploadFilee),
        variables: {"input": uploadFiledEntity.toJson()}));
    if (result.data == null) {
      throw Exception();
    }
    final response = ApiUploadFile.fromJson(result.data!);
    if (response.uploadFile != null && response.uploadFile?.code == 200) {
      return;
    } else {
      throw FormatException(response.uploadFile?.message ?? "");
    }
  }
}
