import 'package:rigow/features/authentication/domain/entities/authentication_entities/register_input.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class RegisterUsecase {
  final AuthenticationRepository repository;

  RegisterUsecase({required this.repository});

  Future<void> execute(RegisterInput registerEntity) async {
    return await repository.register(registerEntity);
  }
}
