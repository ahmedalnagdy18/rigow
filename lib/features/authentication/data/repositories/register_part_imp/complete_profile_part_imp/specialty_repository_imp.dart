import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_specialty.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/specialty_entity.dart';
import 'package:rigow/features/authentication/domain/model/specialty_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class SpecialtyRepositoryImp implements SpecialtyRepository {
  final GraphQLClient graphQLClient;

  SpecialtyRepositoryImp({required this.graphQLClient});

  @override
  Future<PaginateddData<SpecialtyModel>> specialty(
      SpecialtyEntity specialtyEntity) async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(specialtiess),
        variables: {
          "filter": {
            "searchKey": specialtyEntity.searchKey,
          },
          "paginate": {
            "page": specialtyEntity.page,
            "limit": specialtyEntity.limit,
          },
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final response = ApiSpecialties.fromJson(result.data!);

    if (response.specialties?.data != null) {
      final data = response.specialties?.data?.items ?? [];
      final specialList = data.map((e) => e.reviewMap()).toList();
      return PaginateddData(data: specialList);
    } else {
      throw FormatException("Invalid response: ${result.data}");
    }
  }
}
