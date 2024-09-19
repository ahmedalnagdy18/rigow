import 'package:rigow/features/authentication/domain/entities/authentication_entities/forget_pass_input.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class ForgetPassUsecase {
  final AuthenticationRepository repository;

  ForgetPassUsecase({required this.repository});

  Future<void> call({required ForgetPassInput forgetPassEntity}) async {
    return await repository.forgetPassword(forgetPassEntity);
  }
}
