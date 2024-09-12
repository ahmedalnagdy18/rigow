import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/city_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_profile_user_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/countries_entity.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/forget_pass_entity.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/login_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/department_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/faculty_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/signup_part_entity/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/reset_password_entity.dart';
import 'package:rigow/features/authentication/domain/entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/specialty_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/states_entity.dart';
import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_entity.dart';
import 'package:rigow/features/authentication/domain/entities/user_data_for_complete.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/validate_username_entity.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/verify_forget_password_entity.dart';
import 'package:rigow/features/authentication/domain/entities/verify_user_entity.dart';
import 'package:rigow/features/authentication/domain/model/city_model.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/domain/model/department_model.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';
import 'package:rigow/features/authentication/domain/model/specialty_model.dart';
import 'package:rigow/features/authentication/domain/model/states_model.dart';

abstract class LoginRepository {
  Future<void> loginWithEmailAndPassword(LoginEntity loginEntity);
}

abstract class RegisterRepository {
  Future<void> register(RegisterInput registerEntity);
}

abstract class SendEmailVerificationCodeRepository {
  Future<void> sendEmailVerificationCode(
      SendEmailVerificationCodeEntity emailVerificationCodeEntity);
}

abstract class VerifyUserRepository {
  Future<UserDataForComplete> verifyUserByEmail(
      VerifyUserEntity verifyUserEntity);
}

abstract class ValidateUsernameRepository {
  Future<void> validateUsername(ValidateUsernameEntity validateUsernameEntity);
}

abstract class CompleteProfileUserRepository {
  Future<void> completeProfile(
      CompleteProfileUserInput completeProfileUserEntity);
}

abstract class CountriesRepository {
  Future<PaginatedData<CountriesModel>> countries(
      CountriesEntity countriesEntity);
}

abstract class StatesRepository {
  Future<List<StatesModel>> states(StatesEntity statesEntity);
}

abstract class CityRepository {
  Future<List<CityModel>> cities(CityEntity cityEntity);
}

abstract class ForgetPassRepository {
  Future<void> forgetPassword(ForgetPassEntity forgetPassEntity);
}

abstract class ResetPasswordRepository {
  Future<void> resetPasswordByEmail(ResetPasswordEntity resetPasswordEntity);
}

abstract class VerifyForgetPasswordRepository {
  Future<void> verifyForgetPassword(
      VerifyForgetPasswordEntity verifyForgetPasswordEntity);
}

abstract class SpecialtyRepository {
  Future<PaginateddData<SpecialtyModel>> specialty(
      SpecialtyEntity specialtyEntity);
}

abstract class FacultyRepository {
  Future<ToPaginatedData<FacultyModel>> faculty(FacultyEntity facultyEntity);
}

abstract class DepartmentRepository {
  Future<DepartmentPaginatedData<DepartmentModel>> department(
      DepartmentEntity departmentEntity);
}

abstract class SetExpertCompleteProfileRepository {
  Future<void> setExpertCompleteProfile(
      CompleteExpertProfileInput completeExpertProfileInput);
}

abstract class UploadFileRepository {
  Future<void> uploadfile(UploadFiledEntity uploadFiledEntity);
}
