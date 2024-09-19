import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/states_input.dart';
import 'package:rigow/features/authentication/domain/model/states_model.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class StatesUsecase {
  final CompleteProfileRepository repository;

  StatesUsecase({required this.repository});
  Future<List<StatesModel>> call(StatesInput statesEntity) async {
    return await repository.states(statesEntity);
  }
}
