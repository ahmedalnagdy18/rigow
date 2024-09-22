import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/reset_password_input.dart';

part 'api_reset_password_input.g.dart';

@JsonSerializable()
class ApiResetPasswordInput {
  final String email;
  final String newPassword;
  final String code;

  ApiResetPasswordInput(
      {required this.email, required this.newPassword, required this.code});

  Map<String, dynamic> toJson() => _$ApiResetPasswordInputToJson(this);

  factory ApiResetPasswordInput.fromInput(ResetPasswordInput input) {
    return ApiResetPasswordInput(
      email: input.email,
      newPassword: input.newPassword,
      code: input.code,
    );
  }
}
