// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_reset_password_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResetPasswordInput _$ApiResetPasswordInputFromJson(
        Map<String, dynamic> json) =>
    ApiResetPasswordInput(
      email: json['email'] as String,
      newPassword: json['newPassword'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$ApiResetPasswordInputToJson(
        ApiResetPasswordInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'newPassword': instance.newPassword,
      'code': instance.code,
    };
