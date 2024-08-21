import 'package:rigow/features/authentication/domain/entities/validate_username_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class ValidateUsernameUsecase {
  final ValidateUsernameRepository repository;

  ValidateUsernameUsecase({required this.repository});
  Future<void> call(ValidateUsernameEntity validateUsernameEntity) async {
    return await repository.validateUsername(validateUsernameEntity);
  }
}
