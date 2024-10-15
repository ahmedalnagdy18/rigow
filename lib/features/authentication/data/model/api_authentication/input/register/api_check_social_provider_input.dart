import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/check_social_provider_input.dart';

part 'api_check_social_provider_input.g.dart';

@JsonSerializable()
class ApiCheckSocialProviderInput {
  final String email;
  final String providerId;
  final ApiCheckProvidersEnum provider;
  final ApiCheckProviderAuth providerAuth;

  ApiCheckSocialProviderInput(
      {required this.email,
      required this.providerId,
      required this.provider,
      required this.providerAuth});
  factory ApiCheckSocialProviderInput.fromJson(Map<String, dynamic> json) =>
      _$ApiCheckSocialProviderInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCheckSocialProviderInputToJson(this);

  factory ApiCheckSocialProviderInput.fromInput(
      CheckSocialProviderInput input) {
    return ApiCheckSocialProviderInput(
      email: input.email,
      providerAuth: ApiCheckProviderAuth.fromInput(input.authToken),
      provider: socialCheckProvidersEnum(input.provider),
      providerId: input.providerId,
    );
  }
}

enum ApiCheckProvidersEnum {
  FACEBOOK,
  TWITTER,
  GOOGLE,
  APPLE,
}

ApiCheckProvidersEnum socialCheckProvidersEnum(CheckProviderEnum type) {
  switch (type) {
    case CheckProviderEnum.apple:
      return ApiCheckProvidersEnum.APPLE;
    case CheckProviderEnum.google:
      return ApiCheckProvidersEnum.GOOGLE;
    case CheckProviderEnum.facebook:
      return ApiCheckProvidersEnum.FACEBOOK;
    case CheckProviderEnum.twitter:
      return ApiCheckProvidersEnum.TWITTER;
  }
}

@JsonSerializable()
class ApiCheckProviderAuth {
  final String authToken;

  ApiCheckProviderAuth({
    required this.authToken,
  });
  factory ApiCheckProviderAuth.fromJson(Map<String, dynamic> json) =>
      _$ApiCheckProviderAuthFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCheckProviderAuthToJson(this);
  factory ApiCheckProviderAuth.fromInput(CheckProviderAuth input) {
    return ApiCheckProviderAuth(
      authToken: input.authToken,
    );
  }
}
