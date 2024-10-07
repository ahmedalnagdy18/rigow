import 'package:rigow/features/authentication/domain/entities/authentication_entities/forget_pass_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/login_input.dart';

import 'package:rigow/features/authentication/domain/entities/authentication_entities/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/reset_password_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_register_input.dart';

import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/user_data_for_complete.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_forget_password_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_user_input.dart';

abstract class AuthenticationRepository {
  Future<void> loginWithEmailAndPassword(LoginInput input);
  Future<void> register(RegisterInput input);
  Future<void> sendEmailVerificationCode(SendEmailVerificationCodeInput input);
  Future<UserDataForComplete> verifyUserByEmail(VerifyUserInput input);
  Future<void> forgetPassword(ForgetPassInput input);
  Future<void> resetPasswordByEmail(ResetPasswordInput input);
  Future<void> verifyForgetPassword(VerifyForgetPasswordInput input);
  Future<void> socialRegister(SocialRegisterInput input);
}
