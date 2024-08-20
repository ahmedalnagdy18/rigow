import 'package:rigow/features/authentication/domain/entities/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/entities/verify_user_entity.dart';

abstract class RegisterRepository {
  Future<void> register(RegisterInput registerEntity);
}

abstract class SendEmailVerificationCodeRepository {
  Future<void> sendEmailVerificationCode(
      SendEmailVerificationCodeEntity emailVerificationCodeEntity);
}

abstract class VerifyUserRepository {
  Future<void> verifyUserByEmail(VerifyUserEntity verifyUserEntity);
}
