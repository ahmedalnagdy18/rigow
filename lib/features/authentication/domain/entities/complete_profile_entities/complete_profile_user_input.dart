import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_expert_profile_data_input.dart';

class CompleteProfileUserInput {
  final String profilePicture;
  final int countryId;
  final String username;
  final int stateId;
  final int cityId;
  final UserGenderEnum gender;
  final int birthDate;

  CompleteProfileUserInput({
    required this.profilePicture,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.gender,
    required this.birthDate,
    required this.username,
  });
}
