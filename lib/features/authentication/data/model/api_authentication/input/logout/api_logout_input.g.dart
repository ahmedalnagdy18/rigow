// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_logout_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiLogoutInput _$ApiLogoutInputFromJson(Map<String, dynamic> json) =>
    ApiLogoutInput(
      device: $enumDecode(_$ApiDeviceEnumEnumMap, json['device']),
    );

Map<String, dynamic> _$ApiLogoutInputToJson(ApiLogoutInput instance) =>
    <String, dynamic>{
      'device': _$ApiDeviceEnumEnumMap[instance.device]!,
    };

const _$ApiDeviceEnumEnumMap = {
  ApiDeviceEnum.DESKTOP: 'DESKTOP',
  ApiDeviceEnum.IOS: 'IOS',
  ApiDeviceEnum.ANDROID: 'ANDROID',
};
