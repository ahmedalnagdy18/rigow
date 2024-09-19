import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_profile_user_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class CompleteProfileUserUsecase {
  final CompleteProfileRepository repository;

  CompleteProfileUserUsecase({required this.repository});
  Future<void> call(CompleteProfileUserInput completeProfileUserEntity) async {
    return await repository.completeProfile(completeProfileUserEntity);
  }
}
