import 'package:rigow/features/authentication/domain/entities/login_part_entity/forget_pass_entity.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/login_entity.dart';

import 'package:rigow/features/authentication/domain/entities/register_part_entity/signup_part_entity/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/reset_password_entity.dart';
import 'package:rigow/features/authentication/domain/entities/send_email_verification.dart';

import 'package:rigow/features/authentication/domain/entities/user_data_for_complete.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/verify_forget_password_entity.dart';
import 'package:rigow/features/authentication/domain/entities/verify_user_entity.dart';

abstract class AuthenticationRepository {
  Future<void> loginWithEmailAndPassword(LoginEntity loginEntity);
  Future<void> register(RegisterInput input);
  Future<void> sendEmailVerificationCode(
      SendEmailVerificationCodeEntity emailVerificationCodeEntity);
  Future<UserDataForComplete> verifyUserByEmail(
      VerifyUserEntity verifyUserEntity);
  Future<void> forgetPassword(ForgetPassEntity forgetPassEntity);
  Future<void> resetPasswordByEmail(ResetPasswordEntity resetPasswordEntity);
  Future<void> verifyForgetPassword(
      VerifyForgetPasswordEntity verifyForgetPasswordEntity);
}
