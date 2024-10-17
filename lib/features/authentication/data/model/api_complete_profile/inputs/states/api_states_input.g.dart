// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_states_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
ApiStatesInput _$ApiStatesInputFromJson(Map<String, dynamic> json) =>
    ApiStatesInput(
      countryId: (json['countryId'] as num).toInt(),
      searchKey: json['searchKey'] as String,
    );

Map<String, dynamic> _$ApiStatesInputToJson(ApiStatesInput instance) =>
    <String, dynamic>{
      'countryId': instance.countryId,
      'searchKey': instance.searchKey,
    };
