import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_expert_request.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class CompleteExpertProfileRepositoryImp
    extends SetExpertCompleteProfileRepository {
  final GraphQLClient graphQLClient;

  CompleteExpertProfileRepositoryImp({required this.graphQLClient});

  @override
  Future<void> setExpertCompleteProfile(
      CompleteExpertProfileInput completeExpertProfileInput) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(createExpertRequestt),
        variables: {
          "input": completeExpertProfileInput.toJson(),
        },
      ),
    );
    if (result.data == null) {
      throw Exception();
    }
    final response = ApiExpertRequest.fromJson(result.data!);
    if (response.createExpertRequest != null &&
        response.createExpertRequest?.code == 200) {
      return;
    } else {
      throw FormatException(response.createExpertRequest?.message ?? "");
    }
  }
}
