import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/states_input.dart';

part 'api_states_input.g.dart';

@JsonSerializable()
class ApiStatesInput {
  final int countryId;
  final String searchKey;

  ApiStatesInput({required this.countryId, required this.searchKey});

  Map<String, dynamic> toJson() => _$ApiStatesInputToJson(this);

  factory ApiStatesInput.fromInput(StatesInput input) {
    return ApiStatesInput(
      countryId: input.countryId,
      searchKey: input.searchKey,
    );
  }
}
