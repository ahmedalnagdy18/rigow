import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_profile_user_input.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class CompleteProfileUserUsecase {
  final CompleteProfileRepository repository;

  CompleteProfileUserUsecase({required this.repository});
  Future<void> call(CompleteProfileUserInput completeProfileUserEntity) async {
    return await repository.completeProfile(completeProfileUserEntity);
  }
}
