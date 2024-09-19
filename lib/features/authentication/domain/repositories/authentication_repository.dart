import 'package:rigow/features/authentication/domain/entities/authentication_entities/forget_pass_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/login_input.dart';

import 'package:rigow/features/authentication/domain/entities/authentication_entities/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/reset_password_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/send_email_verification.dart';

import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/user_data_for_complete.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_forget_password_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_user_input.dart';

abstract class AuthenticationRepository {
  Future<void> loginWithEmailAndPassword(LoginInput loginEntity);
  Future<void> register(RegisterInput input);
  Future<void> sendEmailVerificationCode(
      SendEmailVerificationCodeInput emailVerificationCodeEntity);
  Future<UserDataForComplete> verifyUserByEmail(
      VerifyUserInput verifyUserEntity);
  Future<void> forgetPassword(ForgetPassInput forgetPassEntity);
  Future<void> resetPasswordByEmail(ResetPasswordInput resetPasswordEntity);
  Future<void> verifyForgetPassword(
      VerifyForgetPasswordInput verifyForgetPasswordEntity);
}
