import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_forget_password_input.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class VerifyForgetPasswordUsecase {
  final AuthenticationRepository repository;

  VerifyForgetPasswordUsecase({required this.repository});

  Future<void> call(
      VerifyForgetPasswordInput verifyForgetPasswordEntity) async {
    return await repository.verifyForgetPassword(verifyForgetPasswordEntity);
  }
}
