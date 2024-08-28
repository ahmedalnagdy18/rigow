import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_verify_forget_password.dart';
import 'package:rigow/features/authentication/domain/entities/verify_forget_password_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class VerifyForgetPasswordRepositoryImp
    implements VerifyForgetPasswordRepository {
  final GraphQLClient graphQLClient;

  VerifyForgetPasswordRepositoryImp({required this.graphQLClient});

  @override
  Future<void> verifyForgetPassword(
      VerifyForgetPasswordEntity verifyForgetPasswordEntity) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(verifyForgetPasswordCodee),
        variables: {
          "input": verifyForgetPasswordEntity.toJson(),
        },
      ),
    );

    if (result.data == null) {}
    final response = ApiVerifyForgetPasswordCode.fromJson(result.data!);
    if (response.verifyForgetPasswordCode != null &&
        response.verifyForgetPasswordCode?.code == 200) {
      final data = response.verifyForgetPasswordCode?.data;

      if (data == null) {
        throw const FormatException("Invalid data received.");
      }

      return;
    } else {
      throw FormatException(response.verifyForgetPasswordCode?.message ?? "");
    }
  }
}
