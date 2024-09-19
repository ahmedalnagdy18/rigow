import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/validate_username_input.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class ValidateUsernameUsecase {
  final CompleteProfileRepository repository;

  ValidateUsernameUsecase({required this.repository});
  Future<void> call(ValidateUsernameInput validateUsernameEntity) async {
    return await repository.validateUsername(validateUsernameEntity);
  }
}
