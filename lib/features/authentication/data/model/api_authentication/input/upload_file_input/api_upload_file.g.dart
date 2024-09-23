// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_upload_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUploadFileInput _$ApiUploadFileInputFromJson(Map<String, dynamic> json) =>
    ApiUploadFileInput(
      file: json['file'] as String,
      model: json['model'] as String,
    );

Map<String, dynamic> _$ApiUploadFileInputToJson(ApiUploadFileInput instance) =>
    <String, dynamic>{
      'file': instance.file,
      'model': instance.model,
    };
