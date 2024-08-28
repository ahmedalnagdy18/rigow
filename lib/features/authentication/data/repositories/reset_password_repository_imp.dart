import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_reset_password.dart';
import 'package:rigow/features/authentication/domain/entities/reset_password_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class ResetPasswordRepositoryImp implements ResetPasswordRepository {
  final GraphQLClient graphQLClient;

  ResetPasswordRepositoryImp({required this.graphQLClient});

  @override
  Future<void> resetPasswordByEmail(
      ResetPasswordEntity resetPasswordEntity) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(resetPasswordByEmaill),
        variables: {
          "input": resetPasswordEntity.toJson(),
        },
      ),
    );

    print(result.exception);

    if (result.data == null) {
      throw Exception();
    }

    final response = ApiResetPasswordByEmail.fromJson(result.data!);
    if (response.resetPasswordByEmail != null &&
        response.resetPasswordByEmail!.code == 200) {
      return;
    } else {
      throw FormatException(response.resetPasswordByEmail?.message ?? "");
    }
  }
}
