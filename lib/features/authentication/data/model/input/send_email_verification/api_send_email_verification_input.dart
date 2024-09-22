import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/send_email_verification.dart';

part 'api_send_email_verification_input.g.dart';

@JsonSerializable()
class ApiSendEmailVerificationInput {
  final String email;
  final String useCase;

  ApiSendEmailVerificationInput({required this.email, required this.useCase});

  Map<String, dynamic> toJson() => _$ApiSendEmailVerificationInputToJson(this);

  factory ApiSendEmailVerificationInput.fromInput(
      SendEmailVerificationCodeInput input) {
    return ApiSendEmailVerificationInput(
      email: input.email,
      useCase: input.useCase,
    );
  }
}
