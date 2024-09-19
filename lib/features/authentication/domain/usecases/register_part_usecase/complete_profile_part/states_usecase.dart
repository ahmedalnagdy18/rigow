import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/states_entity.dart';
import 'package:rigow/features/authentication/domain/model/states_model.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class StatesUsecase {
  final CompleteProfileRepository repository;

  StatesUsecase({required this.repository});
  Future<List<StatesModel>> call(StatesEntity statesEntity) async {
    return await repository.states(statesEntity);
  }
}
