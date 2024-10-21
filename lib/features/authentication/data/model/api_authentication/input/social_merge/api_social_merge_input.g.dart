// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_social_merge_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSocialMergeInput _$ApiSocialMergeInputFromJson(Map<String, dynamic> json) =>
    ApiSocialMergeInput(
      providerId: json['providerId'] as String,
      provider: $enumDecode(_$ApiSocialMergeEnumEnumMap, json['provider']),
      email: json['email'] as String,
      loginDetails: ApiSocialMergeDetailsInput.fromJson(
          json['loginDetails'] as Map<String, dynamic>),
      providerAuth: ApiSocialMergeAuth.fromJson(
          json['providerAuth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiSocialMergeInputToJson(
        ApiSocialMergeInput instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'provider': _$ApiSocialMergeEnumEnumMap[instance.provider]!,
      'email': instance.email,
      'loginDetails': instance.loginDetails,
      'providerAuth': instance.providerAuth,
    };

const _$ApiSocialMergeEnumEnumMap = {
  ApiSocialMergeEnum.FACEBOOK: 'FACEBOOK',
  ApiSocialMergeEnum.TWITTER: 'TWITTER',
  ApiSocialMergeEnum.GOOGLE: 'GOOGLE',
  ApiSocialMergeEnum.APPLE: 'APPLE',
};

ApiSocialMergeDetailsInput _$ApiSocialMergeDetailsInputFromJson(
        Map<String, dynamic> json) =>
    ApiSocialMergeDetailsInput(
      deviceName: json['deviceName'] as String,
      device: $enumDecode(_$ApiSocialMergeDeviceEnumEnumMap, json['device']),
    );

Map<String, dynamic> _$ApiSocialMergeDetailsInputToJson(
        ApiSocialMergeDetailsInput instance) =>
    <String, dynamic>{
      'deviceName': instance.deviceName,
      'device': _$ApiSocialMergeDeviceEnumEnumMap[instance.device]!,
    };

const _$ApiSocialMergeDeviceEnumEnumMap = {
  ApiSocialMergeDeviceEnum.DESKTOP: 'DESKTOP',
  ApiSocialMergeDeviceEnum.IOS: 'IOS',
  ApiSocialMergeDeviceEnum.ANDROID: 'ANDROID',
};

ApiSocialMergeAuth _$ApiSocialMergeAuthFromJson(Map<String, dynamic> json) =>
    ApiSocialMergeAuth(
      authToken: json['authToken'] as String,
    );

Map<String, dynamic> _$ApiSocialMergeAuthToJson(ApiSocialMergeAuth instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
    };
