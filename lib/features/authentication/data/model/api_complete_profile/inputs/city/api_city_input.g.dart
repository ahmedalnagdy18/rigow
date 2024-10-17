// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_city_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
ApiCityInput _$ApiCityInputFromJson(Map<String, dynamic> json) => ApiCityInput(
      stateId: (json['stateId'] as num).toInt(),
      searchKey: json['searchKey'] as String,
    );

Map<String, dynamic> _$ApiCityInputToJson(ApiCityInput instance) =>
    <String, dynamic>{
      'stateId': instance.stateId,
      'searchKey': instance.searchKey,
    };
