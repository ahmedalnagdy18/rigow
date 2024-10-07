import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_register_input.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class SocialRegisterUsecase {
  final AuthenticationRepository repository;

  SocialRegisterUsecase({required this.repository});
  Future<void> execute(SocialRegisterInput input) async {
    return await repository.socialRegister(input);
  }
}
