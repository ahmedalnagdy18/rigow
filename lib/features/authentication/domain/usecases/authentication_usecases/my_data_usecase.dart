import 'package:rigow/features/authentication/domain/entities/authentication_entities/my_data_inputs.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class MyDataUsecase {
  final AuthenticationRepository repository;

  MyDataUsecase({required this.repository});

  Future<UserDataEntity> call() async {
    return await repository.myData();
  }
}
