import 'package:rigow/features/authentication/domain/entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class SendEmailVerificationCodeUsecase {
  final AuthenticationRepository repository;

  SendEmailVerificationCodeUsecase({required this.repository});

  Future<void> call(
      SendEmailVerificationCodeEntity emailVerificationCodeEntity) async {
    return await repository
        .sendEmailVerificationCode(emailVerificationCodeEntity);
  }
}
