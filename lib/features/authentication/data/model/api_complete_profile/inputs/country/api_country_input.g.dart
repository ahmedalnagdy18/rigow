// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_country_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
ApiCountryInput _$ApiCountryInputFromJson(Map<String, dynamic> json) =>
    ApiCountryInput(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      searchKey: json['searchKey'] as String,
    );

Map<String, dynamic> _$ApiCountryInputToJson(ApiCountryInput instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'searchKey': instance.searchKey,
    };
