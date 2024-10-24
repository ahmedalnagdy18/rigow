import 'package:rigow/features/authentication/domain/entities/authentication_entities/all_user_data.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/check_social_provider_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/forget_pass_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/login_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/logout_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/my_data_inputs.dart';

import 'package:rigow/features/authentication/domain/entities/authentication_entities/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/reset_password_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_login_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_merge_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_register_input.dart';

import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/user_data_for_complete.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_forget_password_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_user_input.dart';
import 'package:rigow/features/authentication/domain/model/check_provider_model.dart';
import 'package:rigow/features/authentication/domain/model/social_login_model.dart';
import 'package:rigow/features/authentication/domain/model/social_merge_model.dart';

abstract class AuthenticationRepository {
  Future<AllUserData> loginWithEmailAndPassword(LoginInput input);
  Future<void> register(RegisterInput input);
  Future<void> sendEmailVerificationCode(SendEmailVerificationCodeInput input);
  Future<UserDataForComplete> verifyUserByEmail(VerifyUserInput input);
  Future<void> forgetPassword(ForgetPassInput input);
  Future<void> resetPasswordByEmail(ResetPasswordInput input);
  Future<void> verifyForgetPassword(VerifyForgetPasswordInput input);
  Future<void> socialRegister(SocialRegisterInput input);
  Future<UserDataEntity> myData();
  Future<void> logout(LogoutInput input);
  Future<CheckProviderModel> checkSocialProvider(
      CheckSocialProviderInput input);
  Future<SocialLoginModel> socialLogin(SocialLoginInput input);
  Future<SocialMergeModel> socialMerge(SocialMergeInput input);
}
