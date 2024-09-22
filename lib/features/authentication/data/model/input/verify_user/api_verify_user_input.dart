import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_user_input.dart';

part 'api_verify_user_input.g.dart';

@JsonSerializable()
class ApiVerifyUserInput {
  final String email;
  final String verificationCode;
  final String useCase;

  ApiVerifyUserInput({
    required this.useCase,
    required this.email,
    required this.verificationCode,
  });

  Map<String, dynamic> toJson() => _$ApiVerifyUserInputToJson(this);

  factory ApiVerifyUserInput.fromInput(VerifyUserInput input) {
    return ApiVerifyUserInput(
      email: input.email,
      verificationCode: input.verificationCode,
      useCase: input.useCase,
    );
  }
}
