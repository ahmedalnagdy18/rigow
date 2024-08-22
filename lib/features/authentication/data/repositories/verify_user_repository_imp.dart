import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_verify_user.dart';
import 'package:rigow/features/authentication/domain/entities/user_data_for_complete.dart';
import 'package:rigow/features/authentication/domain/entities/verify_user_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class VerifyUserRepositoryImp implements VerifyUserRepository {
  final GraphQLClient graphQLClient;

  VerifyUserRepositoryImp({required this.graphQLClient});

  @override
  Future<UserDataForComplete> verifyUserByEmail(
      VerifyUserEntity verifyUserEntity) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(verifyUserByEmailInput),
        variables: {
          "input": verifyUserEntity.toJson(),
        },
      ),
    );
    if (result.data == null) {}
    final response = ApiVerifyUserByEmail.fromJson(result.data!);
    if (response.verifyUserByEmail != null &&
        response.verifyUserByEmail?.code == 200) {
      final data = response.verifyUserByEmail?.data;
      if (data == null) {
        throw const FormatException("Invalid data received.");
      }

      return data.toUserDataForComplete();
    } else {
      throw FormatException(response.verifyUserByEmail?.message ?? "");
    }
  }
}
