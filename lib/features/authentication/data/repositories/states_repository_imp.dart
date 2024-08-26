import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_states.dart';
import 'package:rigow/features/authentication/domain/entities/states_entity.dart';
import 'package:rigow/features/authentication/domain/model/states_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class StatesRepositoryImp implements StatesRepository {
  final GraphQLClient graphQLClient;

  StatesRepositoryImp({required this.graphQLClient});

  @override
  Future<List<StatesModel>> states(StatesEntity statesEntity) async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(statess),
        variables: {
          "input": {
            "countryId": statesEntity.countryId,
          },
        },
      ),
    );
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    final response = ApiStates.fromJson(result.data!);

    if (response.states?.data != null) {
      final data = response.states?.data?.items ?? [];
      final stateList = data.map((e) => e.reviewMap()).toList();
      return stateList;
    } else {
      throw FormatException("Invalid response: ${result.data}");
    }
  }
}
