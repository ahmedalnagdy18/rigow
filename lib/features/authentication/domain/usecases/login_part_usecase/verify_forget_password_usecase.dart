import 'package:rigow/features/authentication/domain/entities/login_part_entity/verify_forget_password_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class VerifyForgetPasswordUsecase {
  final VerifyForgetPasswordRepository repository;

  VerifyForgetPasswordUsecase({required this.repository});

  Future<void> call(
      VerifyForgetPasswordEntity verifyForgetPasswordEntity) async {
    return await repository.verifyForgetPassword(verifyForgetPasswordEntity);
  }
}
