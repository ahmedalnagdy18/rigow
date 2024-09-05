import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_faculty.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/faculty_entity.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class FacultyRepositoryImp implements FacultyRepository {
  final GraphQLClient graphQLClient;

  FacultyRepositoryImp({required this.graphQLClient});

  @override
  Future<ToPaginatedData<FacultyModel>> faculty(
      FacultyEntity facultyEntity) async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(facultiess),
        variables: {
          "filter": {
            "searchKey": facultyEntity.searchKey,
            "specialtyId": facultyEntity.specialtyId,
          },
          "paginate": {
            "page": facultyEntity.page,
            "limit": facultyEntity.limit,
          },
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final response = ApiFaculties.fromJson(result.data!);

    if (response.faculties?.data != null) {
      final data = response.faculties?.data?.items ?? [];
      final specialList = data.map((e) => e.reviewMap()).toList();
      return ToPaginatedData(data: specialList);
    } else {
      throw FormatException("Invalid response: ${result.data}");
    }
  }
}
