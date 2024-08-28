import 'package:rigow/features/authentication/domain/entities/reset_password_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class ResetPasswordUsecase {
  final ResetPasswordRepository repository;

  ResetPasswordUsecase({required this.repository});

  Future<void> call(ResetPasswordEntity resetPasswordEntity) async {
    return await repository.resetPasswordByEmail(resetPasswordEntity);
  }
}
