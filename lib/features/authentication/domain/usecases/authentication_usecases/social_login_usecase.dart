import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_login_input.dart';
import 'package:rigow/features/authentication/domain/model/social_login_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class SocialLoginUsecase {
  final AuthenticationRepository repository;

  SocialLoginUsecase({required this.repository});
  Future<SocialLoginModel> execute(SocialLoginInput input) async {
    return await repository.socialLogin(input);
  }
}
