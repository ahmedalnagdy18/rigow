import 'package:rigow/features/authentication/domain/entities/user_data_for_complete.dart';
import 'package:rigow/features/authentication/domain/entities/verify_user_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class VerifyUserUsecase {
  final VerifyUserRepository repository;

  VerifyUserUsecase({required this.repository});

  Future<UserDataForComplete> call(VerifyUserEntity verifyUserEntity) async {
    return await repository.verifyUserByEmail(verifyUserEntity);
  }
}
