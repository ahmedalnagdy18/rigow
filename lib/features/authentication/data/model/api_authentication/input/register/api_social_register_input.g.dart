// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_social_register_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSocialRegisterInput _$ApiSocialRegisterInputFromJson(
        Map<String, dynamic> json) =>
    ApiSocialRegisterInput(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      loginDetails: ApiLoginDetailsInput.fromJson(
          json['loginDetails'] as Map<String, dynamic>),
      role: $enumDecode(_$ApiUserRoleEnumEnumMap, json['role']),
      providerId: json['providerId'] as String,
      provider: $enumDecode(_$ApiSocialProvidersEnumEnumMap, json['provider']),
      providerAuth: ApiProviderAuth.fromJson(
          json['providerAuth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiSocialRegisterInputToJson(
        ApiSocialRegisterInput instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'loginDetails': instance.loginDetails,
      'role': _$ApiUserRoleEnumEnumMap[instance.role]!,
      'providerId': instance.providerId,
      'provider': _$ApiSocialProvidersEnumEnumMap[instance.provider]!,
      'providerAuth': instance.providerAuth,
    };

const _$ApiUserRoleEnumEnumMap = {
  ApiUserRoleEnum.USER: 'USER',
  ApiUserRoleEnum.EXPERT: 'EXPERT',
  ApiUserRoleEnum.APP_ADMIN: 'APP_ADMIN',
};

const _$ApiSocialProvidersEnumEnumMap = {
  ApiSocialProvidersEnum.FACEBOOK: 'FACEBOOK',
  ApiSocialProvidersEnum.TWITTER: 'TWITTER',
  ApiSocialProvidersEnum.GOOGLE: 'GOOGLE',
  ApiSocialProvidersEnum.APPLE: 'APPLE',
};

ApiProviderAuth _$ApiProviderAuthFromJson(Map<String, dynamic> json) =>
    ApiProviderAuth(
      authToken: json['authToken'] as String,
    );

Map<String, dynamic> _$ApiProviderAuthToJson(ApiProviderAuth instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
    };

ApiLoginDetailsInput _$ApiLoginDetailsInputFromJson(
        Map<String, dynamic> json) =>
    ApiLoginDetailsInput(
      deviceName: json['deviceName'] as String,
      device: $enumDecode(_$ApiDeviceEnumEnumMap, json['device']),
    );

Map<String, dynamic> _$ApiLoginDetailsInputToJson(
        ApiLoginDetailsInput instance) =>
    <String, dynamic>{
      'deviceName': instance.deviceName,
      'device': _$ApiDeviceEnumEnumMap[instance.device]!,
    };

const _$ApiDeviceEnumEnumMap = {
  ApiDeviceEnum.DESKTOP: 'DESKTOP',
  ApiDeviceEnum.IOS: 'IOS',
  ApiDeviceEnum.ANDROID: 'ANDROID',
};
