import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/validate_username_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class ValidateUsernameUsecase {
  final CompleteProfileRepository repository;

  ValidateUsernameUsecase({required this.repository});
  Future<void> call(ValidateUsernameEntity validateUsernameEntity) async {
    return await repository.validateUsername(validateUsernameEntity);
  }
}
