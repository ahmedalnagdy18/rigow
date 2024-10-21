import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_merge_input.dart';

part 'api_social_merge_input.g.dart';

@JsonSerializable()
class ApiSocialMergeInput {
  final String providerId;
  final ApiSocialMergeEnum provider;
  final String email;
  final ApiSocialMergeDetailsInput loginDetails;
  final ApiSocialMergeAuth providerAuth;

  ApiSocialMergeInput(
      {required this.providerId,
      required this.provider,
      required this.email,
      required this.loginDetails,
      required this.providerAuth});

  factory ApiSocialMergeInput.fromJson(Map<String, dynamic> json) =>
      _$ApiSocialMergeInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSocialMergeInputToJson(this);
  factory ApiSocialMergeInput.fromInput(SocialMergeInput input) {
    return ApiSocialMergeInput(
      providerId: input.providerId,
      provider: socialCheckProvidersEnum(input.provider),
      email: input.email,
      loginDetails: ApiSocialMergeDetailsInput.fromInput(input.loginDetails),
      providerAuth: ApiSocialMergeAuth.fromInput(input.authToken),
    );
  }
}

enum ApiSocialMergeEnum {
  FACEBOOK,
  TWITTER,
  GOOGLE,
  APPLE,
}

ApiSocialMergeEnum socialCheckProvidersEnum(SocialMergeEnum type) {
  switch (type) {
    case SocialMergeEnum.apple:
      return ApiSocialMergeEnum.APPLE;
    case SocialMergeEnum.google:
      return ApiSocialMergeEnum.GOOGLE;
    case SocialMergeEnum.facebook:
      return ApiSocialMergeEnum.FACEBOOK;
    case SocialMergeEnum.twitter:
      return ApiSocialMergeEnum.TWITTER;
  }
}

@JsonSerializable()
class ApiSocialMergeDetailsInput {
  final String deviceName;
  final ApiSocialMergeDeviceEnum device;

  ApiSocialMergeDetailsInput({
    required this.deviceName,
    required this.device,
  });
  factory ApiSocialMergeDetailsInput.fromJson(Map<String, dynamic> json) =>
      _$ApiSocialMergeDetailsInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSocialMergeDetailsInputToJson(this);

  factory ApiSocialMergeDetailsInput.fromInput(SocialMergeDetailsInput input) {
    return ApiSocialMergeDetailsInput(
      deviceName: input.deviceName,
      device: deviceEnum(input.deviceType),
    );
  }
}

enum ApiSocialMergeDeviceEnum {
  DESKTOP,
  IOS,
  ANDROID,
}

ApiSocialMergeDeviceEnum deviceEnum(SocialMergeDeviceEnum type) {
  switch (type) {
    case SocialMergeDeviceEnum.android:
      return ApiSocialMergeDeviceEnum.ANDROID;
    case SocialMergeDeviceEnum.desktop:
      return ApiSocialMergeDeviceEnum.DESKTOP;
    case SocialMergeDeviceEnum.ios:
      return ApiSocialMergeDeviceEnum.IOS;
  }
}

@JsonSerializable()
class ApiSocialMergeAuth {
  final String authToken;

  ApiSocialMergeAuth({required this.authToken});
  factory ApiSocialMergeAuth.fromJson(Map<String, dynamic> json) =>
      _$ApiSocialMergeAuthFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSocialMergeAuthToJson(this);
  factory ApiSocialMergeAuth.fromInput(SocialMergeAuth input) {
    return ApiSocialMergeAuth(
      authToken: input.authToken,
    );
  }
}
