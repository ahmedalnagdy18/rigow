import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_complete_profile.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_profile_user_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class CompleteProfileUserRepoImp implements CompleteProfileUserRepository {
  final GraphQLClient graphQLClient;

  CompleteProfileUserRepoImp({required this.graphQLClient});

  @override
  Future<void> completeProfile(CompleteProfileUserInput input) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(completeProfileAsUserr),
        variables: {
          "input": input.toJson(),
        },
      ),
    );
    if (result.data == null) {
      throw Exception('data return null');
    }
    final response = ApiCompleteProfileAsUser.fromJson(result.data!);
    if (response.completeProfileAsUser != null &&
        response.completeProfileAsUser?.code == 200) {
      return;
    } else {
      throw FormatException(response.completeProfileAsUser?.message ?? "");
    }
  }
}