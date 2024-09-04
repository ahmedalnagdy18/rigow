import 'package:rigow/features/authentication/domain/entities/login_part_entity/forget_pass_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class ForgetPassUsecase {
  final ForgetPassRepository repository;

  ForgetPassUsecase({required this.repository});

  Future<void> call({required ForgetPassEntity forgetPassEntity}) async {
    return await repository.forgetPassword(forgetPassEntity);
  }
}
