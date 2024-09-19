import 'package:rigow/features/authentication/domain/entities/authentication_entities/reset_password_input.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class ResetPasswordUsecase {
  final AuthenticationRepository repository;

  ResetPasswordUsecase({required this.repository});

  Future<void> call(ResetPasswordInput resetPasswordEntity) async {
    return await repository.resetPasswordByEmail(resetPasswordEntity);
  }
}
