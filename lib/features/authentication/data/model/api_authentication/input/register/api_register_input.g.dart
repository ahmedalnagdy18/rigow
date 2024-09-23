// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_register_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRegisterInput _$ApiRegisterInputFromJson(Map<String, dynamic> json) =>
    ApiRegisterInput(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      loginDetails: ApiLoginDetailsInput.fromJson(
          json['loginDetails'] as Map<String, dynamic>),
      role: $enumDecode(_$ApiUserRoleEnumEnumMap, json['role']),
    );

Map<String, dynamic> _$ApiRegisterInputToJson(ApiRegisterInput instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'loginDetails': instance.loginDetails,
      'role': _$ApiUserRoleEnumEnumMap[instance.role]!,
    };

const _$ApiUserRoleEnumEnumMap = {
  ApiUserRoleEnum.USER: 'USER',
  ApiUserRoleEnum.EXPERT: 'EXPERT',
  ApiUserRoleEnum.APP_ADMIN: 'APP_ADMIN',
};
