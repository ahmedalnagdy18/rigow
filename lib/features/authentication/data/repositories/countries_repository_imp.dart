import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_countries.dart';
import 'package:rigow/features/authentication/domain/entities/countries_entity.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class CountriesRepositoryImp implements CountriesRepository {
  final GraphQLClient graphQLClient;

  CountriesRepositoryImp({required this.graphQLClient});

  @override
  Future<PaginatedData<CountriesModel>> countries(
      CountriesEntity countriesEntity) async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(countriess),
        variables: {
          "paginate": {
            "page": countriesEntity.page,
            "limit": countriesEntity.limit,
          },
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final response = ApiCountries.fromJson(result.data!);

    if (response.countries?.data != null) {
      final data = response.countries?.data?.items ?? [];
      final countryList = data.map((e) => e.reviewMap()).toList();
      return PaginatedData(data: countryList);
    } else {
      throw FormatException("Invalid response: ${result.data}");
    }
  }
}
