import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/city_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_profile_user_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/countries_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/department_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/faculty_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/specialty_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/states_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/validate_username_input.dart';
import 'package:rigow/features/authentication/domain/model/city_model.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/domain/model/department_model.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';
import 'package:rigow/features/authentication/domain/model/specialty_model.dart';
import 'package:rigow/features/authentication/domain/model/states_model.dart';

abstract class CompleteProfileRepository {
  Future<void> completeProfile(CompleteProfileUserInput input);

  Future<PaginatedData<CountriesModel>> countries(
      CountriesInput countriesEntity);

  Future<List<StatesModel>> states(StatesInput input);
  Future<List<CityModel>> cities(CityInput input);
  Future<PaginateddData<SpecialtyModel>> specialty(
      SpecialtyInput specialtyEntity);

  Future<ToPaginatedData<FacultyModel>> faculty(FacultyInput facultyEntity);

  Future<DepartmentPaginatedData<DepartmentModel>> department(
      DepartmentInput departmentEntity);
  Future<void> setExpertCompleteProfile(CompleteExpertProfileInput input);
  Future<void> validateUsername(ValidateUsernameInput input);
}
