import 'package:rigow/features/authentication/domain/entities/city_entity.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_user_entity.dart';
import 'package:rigow/features/authentication/domain/entities/countries_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/entities/states_entity.dart';
import 'package:rigow/features/authentication/domain/entities/user_data_for_complete.dart';
import 'package:rigow/features/authentication/domain/entities/validate_username_entity.dart';
import 'package:rigow/features/authentication/domain/entities/verify_user_entity.dart';
import 'package:rigow/features/authentication/domain/model/city_model.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/domain/model/states_model.dart';

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
      CompleteProfileUserEntity completeProfileUserEntity);
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
