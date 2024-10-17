// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_send_email_verification_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
ApiSendEmailVerificationInput _$ApiSendEmailVerificationInputFromJson(
        Map<String, dynamic> json) =>
    ApiSendEmailVerificationInput(
      email: json['email'] as String,
      useCase: json['useCase'] as String,
    );

Map<String, dynamic> _$ApiSendEmailVerificationInputToJson(
        ApiSendEmailVerificationInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'useCase': instance.useCase,
    };
