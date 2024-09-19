import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_expert_profile_data_input.dart';
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
