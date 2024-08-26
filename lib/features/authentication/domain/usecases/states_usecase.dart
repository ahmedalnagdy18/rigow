import 'package:rigow/features/authentication/domain/entities/states_entity.dart';
import 'package:rigow/features/authentication/domain/model/states_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class StatesUsecase {
  final StatesRepository repository;

  StatesUsecase({required this.repository});
  Future<List<StatesModel>> call(StatesEntity statesEntity) async {
    return await repository.states(statesEntity);
  }
}
