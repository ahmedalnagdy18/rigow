// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_forget_password_input.dart';

part 'api_verify_forget_password_input.g.dart';

@JsonSerializable()
class ApiVerifyForgetPasswordInput {
  final String email;
  final String verificationCode;

  ApiVerifyForgetPasswordInput({
    required this.email,
    required this.verificationCode,
  });
  factory ApiVerifyForgetPasswordInput.fromInput(
      VerifyForgetPasswordInput input) {
    return ApiVerifyForgetPasswordInput(
      email: input.email,
      verificationCode: input.verificationCode,
    );
  }
  Map<String, dynamic> toJson() => _$ApiVerifyForgetPasswordInputToJson(this);
}
