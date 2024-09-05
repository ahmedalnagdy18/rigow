import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_department.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/department_entity.dart';
import 'package:rigow/features/authentication/domain/model/department_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class DepartmentRepositoryImp implements DepartmentRepository {
  final GraphQLClient graphQLClient;

  DepartmentRepositoryImp({required this.graphQLClient});

  @override
  Future<DepartmentPaginatedData<DepartmentModel>> department(
      DepartmentEntity departmentEntity) async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(departmentss),
        variables: {
          "filter": {
            "searchKey": departmentEntity.searchKey,
            "facultyId": departmentEntity.facultyId,
          },
          "paginate": {
            "page": departmentEntity.page,
            "limit": departmentEntity.limit,
          },
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final response = ApiDepartments.fromJson(result.data!);

    if (response.departments?.data != null) {
      final data = response.departments?.data?.items ?? [];
      final specialList = data.map((e) => e.reviewMap()).toList();
      return DepartmentPaginatedData(data: specialList);
    } else {
      throw FormatException("Invalid response: ${result.data}");
    }
  }
}
