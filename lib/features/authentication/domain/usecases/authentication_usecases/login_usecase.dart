import 'package:rigow/features/authentication/domain/entities/authentication_entities/all_user_data.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/login_input.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class LoginUsecase {
  final AuthenticationRepository repository;

  LoginUsecase({required this.repository});

  Future<AllUserData> call(LoginInput loginEntity) async {
    return await repository.loginWithEmailAndPassword(loginEntity);
  }
}
