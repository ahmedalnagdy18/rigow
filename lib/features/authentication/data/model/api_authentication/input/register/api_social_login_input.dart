import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_login_input.dart';

part 'api_social_login_input.g.dart';

@JsonSerializable()
class ApiSocialLoginInput {
  final ApiLoginDetailsInput loginDetails;
  final ApiUserRoleEnum role;
  final String providerId;
  final ApiSocialProvidersEnum provider;

  ApiSocialLoginInput(
      {required this.loginDetails,
      required this.role,
      required this.providerId,
      required this.provider});

  factory ApiSocialLoginInput.fromJson(Map<String, dynamic> json) =>
      _$ApiSocialLoginInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSocialLoginInputToJson(this);

  factory ApiSocialLoginInput.fromInput(SocialLoginInput input) {
    return ApiSocialLoginInput(
      loginDetails: ApiLoginDetailsInput.fromInput(input.loginDetails),
      role: userRoleToApi(input.role),
      provider: socialProvidersEnum(input.provider),
      providerId: input.providerId,
    );
  }
}

@JsonSerializable()
class ApiLoginDetailsInput {
  final String deviceName;
  final ApiDeviceEnum device;

  ApiLoginDetailsInput({
    required this.deviceName,
    required this.device,
  });
  factory ApiLoginDetailsInput.fromJson(Map<String, dynamic> json) =>
      _$ApiLoginDetailsInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiLoginDetailsInputToJson(this);
  factory ApiLoginDetailsInput.fromInput(SocialLoginDetailsInput input) {
    return ApiLoginDetailsInput(
      deviceName: input.deviceName,
      device: deviceEnum(input.deviceType),
    );
  }
}

enum ApiDeviceEnum {
  DESKTOP,
  IOS,
  ANDROID,
}

ApiDeviceEnum deviceEnum(SocialDeviceEnum type) {
  switch (type) {
    case SocialDeviceEnum.android:
      return ApiDeviceEnum.ANDROID;
    case SocialDeviceEnum.desktop:
      return ApiDeviceEnum.DESKTOP;
    case SocialDeviceEnum.ios:
      return ApiDeviceEnum.IOS;
  }
}

enum ApiSocialProvidersEnum {
  FACEBOOK,
  TWITTER,
  GOOGLE,
  APPLE,
}

ApiSocialProvidersEnum socialProvidersEnum(SocialProviderEnum type) {
  switch (type) {
    case SocialProviderEnum.apple:
      return ApiSocialProvidersEnum.APPLE;
    case SocialProviderEnum.google:
      return ApiSocialProvidersEnum.GOOGLE;
    case SocialProviderEnum.facebook:
      return ApiSocialProvidersEnum.FACEBOOK;
    case SocialProviderEnum.twitter:
      return ApiSocialProvidersEnum.TWITTER;
  }
}

enum ApiUserRoleEnum { USER, EXPERT, APP_ADMIN }

ApiUserRoleEnum userRoleToApi(SocialUserRoleEnum type) {
  switch (type) {
    case SocialUserRoleEnum.user:
      return ApiUserRoleEnum.USER;
    case SocialUserRoleEnum.expert:
      return ApiUserRoleEnum.EXPERT;
    case SocialUserRoleEnum.admin:
      return ApiUserRoleEnum.APP_ADMIN;
  }
}
