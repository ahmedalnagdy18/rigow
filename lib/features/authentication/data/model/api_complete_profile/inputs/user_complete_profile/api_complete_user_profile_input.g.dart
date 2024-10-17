// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_complete_user_profile_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
ApiCompleteUserProfileInput _$ApiCompleteUserProfileInputFromJson(
        Map<String, dynamic> json) =>
    ApiCompleteUserProfileInput(
      profilePicture: json['profilePicture'] as String,
      countryId: (json['countryId'] as num).toInt(),
      stateId: (json['stateId'] as num).toInt(),
      cityId: (json['cityId'] as num).toInt(),
      gender: $enumDecode(_$ApiGenderEnumEnumMap, json['gender']),
      birthDate: (json['birthDate'] as num).toInt(),
      username: json['username'] as String,
    );

Map<String, dynamic> _$ApiCompleteUserProfileInputToJson(
        ApiCompleteUserProfileInput instance) =>
    <String, dynamic>{
      'profilePicture': instance.profilePicture,
      'countryId': instance.countryId,
      'username': instance.username,
      'stateId': instance.stateId,
      'cityId': instance.cityId,
      'gender': _$ApiGenderEnumEnumMap[instance.gender]!,
      'birthDate': instance.birthDate,
    };

const _$ApiGenderEnumEnumMap = {
  ApiGenderEnum.MALE: 'MALE',
  ApiGenderEnum.FEMALE: 'FEMALE',
};
