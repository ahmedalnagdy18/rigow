import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/validate_username_input.dart';

part 'api_validate_username_input.g.dart';

@JsonSerializable()
class ApiValidateUsernameInput {
  final String username;

  ApiValidateUsernameInput({required this.username});

  Map<String, dynamic> toJson() => _$ApiValidateUsernameInputToJson(this);

  factory ApiValidateUsernameInput.fromInput(ValidateUsernameInput input) {
    return ApiValidateUsernameInput(
      username: input.username,
    );
  }
}
