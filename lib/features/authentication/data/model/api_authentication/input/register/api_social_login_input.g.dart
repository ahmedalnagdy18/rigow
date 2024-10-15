// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_social_login_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSocialLoginInput _$ApiSocialLoginInputFromJson(Map<String, dynamic> json) =>
    ApiSocialLoginInput(
      loginDetails: ApiLoginDetailsInput.fromJson(
          json['loginDetails'] as Map<String, dynamic>),
      role: $enumDecode(_$ApiUserRoleEnumEnumMap, json['role']),
      providerId: json['providerId'] as String,
      provider: $enumDecode(_$ApiSocialProvidersEnumEnumMap, json['provider']),
    );

Map<String, dynamic> _$ApiSocialLoginInputToJson(
        ApiSocialLoginInput instance) =>
    <String, dynamic>{
      'loginDetails': instance.loginDetails,
      'role': _$ApiUserRoleEnumEnumMap[instance.role]!,
      'providerId': instance.providerId,
      'provider': _$ApiSocialProvidersEnumEnumMap[instance.provider]!,
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
