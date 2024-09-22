// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_verify_user_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiVerifyUserInput _$ApiVerifyUserInputFromJson(Map<String, dynamic> json) =>
    ApiVerifyUserInput(
      useCase: json['useCase'] as String,
      email: json['email'] as String,
      verificationCode: json['verificationCode'] as String,
    );

Map<String, dynamic> _$ApiVerifyUserInputToJson(ApiVerifyUserInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'verificationCode': instance.verificationCode,
      'useCase': instance.useCase,
    };
