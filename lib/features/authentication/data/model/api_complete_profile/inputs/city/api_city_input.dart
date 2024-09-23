import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/city_input.dart';

part 'api_city_input.g.dart';

@JsonSerializable()
class ApiCityInput {
  final int stateId;
  final String searchKey;

  ApiCityInput({required this.stateId, required this.searchKey});

  Map<String, dynamic> toJson() => _$ApiCityInputToJson(this);

  factory ApiCityInput.fromInput(CityInput input) {
    return ApiCityInput(
      stateId: input.stateId,
      searchKey: input.searchKey,
    );
  }
}
