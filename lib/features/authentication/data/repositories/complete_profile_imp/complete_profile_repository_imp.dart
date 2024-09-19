import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_city.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_complete_profile.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_countries.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_department.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_expert_request.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_faculty.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_specialty.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_states.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_validate_username.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/city_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_profile_user_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/countries_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/department_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/faculty_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/specialty_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/states_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/validate_username_entity.dart';
import 'package:rigow/features/authentication/domain/model/city_model.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/domain/model/department_model.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';
import 'package:rigow/features/authentication/domain/model/specialty_model.dart';
import 'package:rigow/features/authentication/domain/model/states_model.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class CompleteProfileRepositoryImp extends CompleteProfileRepository {
  final GraphQLClient graphQLClient;

  CompleteProfileRepositoryImp({required this.graphQLClient});

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

  @override
  Future<PaginatedData<CountriesModel>> countries(
      CountriesEntity countriesEntity) async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(countriess),
        variables: {
          "searchKey": countriesEntity.searchKey,
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

    final response = ApiDepartments.fromJson(result.data!).departments;
    if (response?.data != null) {
      final data = response?.data?.items ?? [];
      final departmentList = data.map((e) => e.reviewMap()).toList();
      return DepartmentPaginatedData(
        data: departmentList,
      );
    } else {
      throw FormatException("Invalid response: ${result.data}");
    }
  }

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

  @override
  Future<List<StatesModel>> states(StatesEntity statesEntity) async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(statess),
        variables: {
          "input": {
            "searchKey": statesEntity.searchKey,
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
