// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_verify_forget_password_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
ApiVerifyForgetPasswordInput _$ApiVerifyForgetPasswordInputFromJson(
        Map<String, dynamic> json) =>
    ApiVerifyForgetPasswordInput(
      email: json['email'] as String,
      verificationCode: json['verificationCode'] as String,
    );

Map<String, dynamic> _$ApiVerifyForgetPasswordInputToJson(
        ApiVerifyForgetPasswordInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'verificationCode': instance.verificationCode,
    };
