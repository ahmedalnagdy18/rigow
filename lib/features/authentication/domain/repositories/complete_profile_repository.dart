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

abstract class CompleteProfileRepository {
  Future<void> completeProfile(CompleteProfileUserInput input);

  Future<PaginatedData<CountriesModel>> countries(
      CountriesEntity countriesEntity);

  Future<List<StatesModel>> states(StatesEntity statesEntity);
  Future<List<CityModel>> cities(CityEntity cityEntity);
  Future<PaginateddData<SpecialtyModel>> specialty(
      SpecialtyEntity specialtyEntity);

  Future<ToPaginatedData<FacultyModel>> faculty(FacultyEntity facultyEntity);

  Future<DepartmentPaginatedData<DepartmentModel>> department(
      DepartmentEntity departmentEntity);
  Future<void> setExpertCompleteProfile(
      CompleteExpertProfileInput completeExpertProfileInput);
  Future<void> validateUsername(ValidateUsernameEntity validateUsernameEntity);
}
