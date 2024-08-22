import 'package:rigow/features/authentication/domain/entities/complete_profile_user_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class CompleteProfileUserUsecase {
  final CompleteProfileUserRepository repository;

  CompleteProfileUserUsecase({required this.repository});
  Future<void> call(CompleteProfileUserEntity completeProfileUserEntity) async {
    return await repository.completeProfile(completeProfileUserEntity);
  }
}
