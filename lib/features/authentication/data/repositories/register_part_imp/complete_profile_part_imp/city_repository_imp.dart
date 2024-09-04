import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_city.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/city_entity.dart';
import 'package:rigow/features/authentication/domain/model/city_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class CityRepositoryImp implements CityRepository {
  final GraphQLClient graphQLClient;

  CityRepositoryImp({required this.graphQLClient});

  @override
  Future<List<CityModel>> cities(CityEntity cityEntity) async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(citiess),
        variables: {
          "cityid": {
            "stateId": cityEntity.stateId,
            "searchKey": cityEntity.searchKey,
          },
        },
      ),
    );
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    final response = ApiCities.fromJson(result.data!);

    if (response.cities?.data != null) {
      final data = response.cities?.data?.items ?? [];
      final stateList = data.map((e) => e.reviewMap()).toList();

      return stateList;
    } else {
      throw FormatException("Invalid response: ${result.data}");
    }
  }
}
