import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_validate_username.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/validate_username_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class ValidateUsernameRepositoryImp implements ValidateUsernameRepository {
  final GraphQLClient graphQLClient;

  ValidateUsernameRepositoryImp({required this.graphQLClient});

  @override
  Future<void> validateUsername(
      ValidateUsernameEntity validateUsernameEntity) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(validateUsernamee),
        variables: validateUsernameEntity.toJson(),
      ),
    );
    if (result.data == null) {
      throw Exception();
    }
    final response = ApiValidateUsername.fromJson(result.data!);
    if (response.validateUsername != null &&
        response.validateUsername?.code == 200) {
      return;
    } else {
      throw FormatException(response.validateUsername?.message ?? "");
    }
  }
}
