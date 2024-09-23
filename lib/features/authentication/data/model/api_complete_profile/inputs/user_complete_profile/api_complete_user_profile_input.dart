import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/data/model/api_complete_profile/inputs/expert_complete_profile/api_expert_complete_profile_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_profile_user_input.dart';

part 'api_complete_user_profile_input.g.dart';

@JsonSerializable()
class ApiCompleteUserProfileInput {
  final String profilePicture;
  final int countryId;
  final String username;
  final int stateId;
  final int cityId;
  final ApiGenderEnum gender;
  final int birthDate;

  ApiCompleteUserProfileInput({
    required this.profilePicture,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.gender,
    required this.birthDate,
    required this.username,
  });

  Map<String, dynamic> toJson() => _$ApiCompleteUserProfileInputToJson(this);

  factory ApiCompleteUserProfileInput.fromInput(
      CompleteProfileUserInput input) {
    return ApiCompleteUserProfileInput(
      profilePicture: input.profilePicture,
      countryId: input.countryId,
      username: input.username,
      stateId: input.stateId,
      cityId: input.cityId,
      gender: gendetToApi(input.gender),
      birthDate: input.birthDate,
    );
  }
}
