import 'package:rigow/features/authentication/domain/entities/login_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase({required this.repository});

  Future<void> call(LoginEntity loginEntity) async {
    return await repository.loginWithEmailAndPassword(loginEntity);
  }
}
