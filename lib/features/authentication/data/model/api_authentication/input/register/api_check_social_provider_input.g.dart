// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_check_social_provider_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiCheckSocialProviderInput _$ApiCheckSocialProviderInputFromJson(
        Map<String, dynamic> json) =>
    ApiCheckSocialProviderInput(
      email: json['email'] as String,
      providerId: json['providerId'] as String,
      provider: $enumDecode(_$ApiCheckProvidersEnumEnumMap, json['provider']),
      providerAuth: ApiCheckProviderAuth.fromJson(
          json['providerAuth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCheckSocialProviderInputToJson(
        ApiCheckSocialProviderInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'providerId': instance.providerId,
      'provider': _$ApiCheckProvidersEnumEnumMap[instance.provider]!,
      'providerAuth': instance.providerAuth,
    };

const _$ApiCheckProvidersEnumEnumMap = {
  ApiCheckProvidersEnum.FACEBOOK: 'FACEBOOK',
  ApiCheckProvidersEnum.TWITTER: 'TWITTER',
  ApiCheckProvidersEnum.GOOGLE: 'GOOGLE',
  ApiCheckProvidersEnum.APPLE: 'APPLE',
};

ApiCheckProviderAuth _$ApiCheckProviderAuthFromJson(
        Map<String, dynamic> json) =>
    ApiCheckProviderAuth(
      authToken: json['authToken'] as String,
    );

Map<String, dynamic> _$ApiCheckProviderAuthToJson(
        ApiCheckProviderAuth instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
    };
