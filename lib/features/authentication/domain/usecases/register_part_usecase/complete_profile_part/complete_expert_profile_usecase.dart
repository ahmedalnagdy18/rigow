import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class CompleteExpertProfileUsecase {
  final CompleteProfileRepository repository;

  CompleteExpertProfileUsecase({required this.repository});

  Future<void> call(
      CompleteExpertProfileInput completeExpertProfileInput) async {
    return await repository
        .setExpertCompleteProfile(completeExpertProfileInput);
  }
}
