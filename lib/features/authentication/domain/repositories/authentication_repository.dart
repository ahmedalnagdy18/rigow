import 'package:rigow/features/authentication/domain/entities/register_input.dart';

abstract class RegisterRepository {
  Future<void> register(RegisterInput registerEntity);
}
