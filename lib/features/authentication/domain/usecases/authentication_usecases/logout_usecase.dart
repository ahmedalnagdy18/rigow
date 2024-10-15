import 'package:rigow/features/authentication/domain/entities/authentication_entities/logout_input.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class LogoutUsecase {
  final AuthenticationRepository repository;

  LogoutUsecase({required this.repository});

  Future<void> call(LogoutInput input) async {
    return await repository.logout(input);
  }
}
