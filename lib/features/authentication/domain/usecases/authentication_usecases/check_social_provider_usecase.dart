import 'package:rigow/features/authentication/domain/entities/authentication_entities/check_social_provider_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/my_data_inputs.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class CheckSocialProviderUsecase {
  final AuthenticationRepository repository;

  CheckSocialProviderUsecase({required this.repository});

  Future<UserDataEntity> execute(CheckSocialProviderInput input) async {
    return await repository.checkSocialProvider(input);
  }
}
