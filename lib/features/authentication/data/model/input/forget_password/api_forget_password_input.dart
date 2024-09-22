import 'package:json_annotation/json_annotation.dart';

import 'package:rigow/features/authentication/domain/entities/authentication_entities/forget_pass_input.dart';
part 'api_forget_password_input.g.dart';

@JsonSerializable()
class ApiForgetPasswordInput {
  final String email;

  ApiForgetPasswordInput({required this.email});

  Map<String, dynamic> toJson() => _$ApiForgetPasswordInputToJson(this);

  factory ApiForgetPasswordInput.fromInput(ForgetPassInput input) {
    return ApiForgetPasswordInput(
      email: input.email,
    );
  }
}
