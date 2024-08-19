import 'package:rigow/features/authentication/domain/entities/register_input.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class RegisterUsecase {
  final RegisterRepository repository;

  RegisterUsecase({required this.repository});

  Future<void> execute(RegisterInput registerEntity) async {
    return await repository.register(registerEntity);
  }
}
