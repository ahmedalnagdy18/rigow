import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_register_input.dart';

part 'api_social_register_input.g.dart';

@JsonSerializable()
class ApiSocialRegisterInput {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final ApiLoginDetailsInput loginDetails;
  final ApiUserRoleEnum role;
  final String providerId;
  final ApiSocialProvidersEnum provider;
  final ApiProviderAuth providerAuth;

  ApiSocialRegisterInput({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.loginDetails,
    required this.role,
    required this.providerId,
    required this.provider,
    required this.providerAuth,
  });
  factory ApiSocialRegisterInput.fromJson(Map<String, dynamic> json) =>
      _$ApiSocialRegisterInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSocialRegisterInputToJson(this);

  factory ApiSocialRegisterInput.fromInput(SocialRegisterInput input) {
    return ApiSocialRegisterInput(
      firstName: input.firstName,
      lastName: input.lastName,
      phone: input.phone,
      email: input.email,
      loginDetails: ApiLoginDetailsInput.fromInput(input.loginDetails),
      role: userRoleToApi(input.role),
      providerAuth: ApiProviderAuth.fromInput(input.authToken),
      provider: socialProvidersEnum(input.provider),
      providerId: input.providerId,
    );
  }
}

@JsonSerializable()
class ApiProviderAuth {
  final String authToken;

  ApiProviderAuth({
    required this.authToken,
  });
  factory ApiProviderAuth.fromJson(Map<String, dynamic> json) =>
      _$ApiProviderAuthFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProviderAuthToJson(this);
  factory ApiProviderAuth.fromInput(ProviderAuth input) {
    return ApiProviderAuth(
      authToken: input.authToken,
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
  factory ApiLoginDetailsInput.fromInput(LoginDetailsInput input) {
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

ApiDeviceEnum deviceEnum(DeviceEnum type) {
  switch (type) {
    case DeviceEnum.android:
      return ApiDeviceEnum.ANDROID;
    case DeviceEnum.desktop:
      return ApiDeviceEnum.DESKTOP;
    case DeviceEnum.ios:
      return ApiDeviceEnum.IOS;
  }
}

enum ApiSocialProvidersEnum {
  FACEBOOK,
  TWITTER,
  GOOGLE,
  APPLE,
}

ApiSocialProvidersEnum socialProvidersEnum(ProviderEnum type) {
  switch (type) {
    case ProviderEnum.apple:
      return ApiSocialProvidersEnum.APPLE;
    case ProviderEnum.google:
      return ApiSocialProvidersEnum.GOOGLE;
    case ProviderEnum.facebook:
      return ApiSocialProvidersEnum.FACEBOOK;
    case ProviderEnum.twitter:
      return ApiSocialProvidersEnum.TWITTER;
  }
}

enum ApiUserRoleEnum { USER, EXPERT, APP_ADMIN }

ApiUserRoleEnum userRoleToApi(UserRoleEnum type) {
  switch (type) {
    case UserRoleEnum.user:
      return ApiUserRoleEnum.USER;
    case UserRoleEnum.expert:
      return ApiUserRoleEnum.EXPERT;
    case UserRoleEnum.admin:
      return ApiUserRoleEnum.APP_ADMIN;
  }
}
