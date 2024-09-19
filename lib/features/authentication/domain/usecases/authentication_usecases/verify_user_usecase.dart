import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/user_data_for_complete.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_user_input.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class VerifyUserUsecase {
  final AuthenticationRepository repository;

  VerifyUserUsecase({required this.repository});

  Future<UserDataForComplete> call(VerifyUserInput verifyUserEntity) async {
    return await repository.verifyUserByEmail(verifyUserEntity);
  }
}
