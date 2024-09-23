import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/countries_input.dart';

part 'api_country_input.g.dart';

@JsonSerializable()
class ApiCountryInput {
  final int page;
  final int limit;
  final String searchKey;

  ApiCountryInput(
      {required this.page, required this.limit, required this.searchKey});

  Map<String, dynamic> toJson() => _$ApiCountryInputToJson(this);

  factory ApiCountryInput.fromInput(CountriesInput input) {
    return ApiCountryInput(
      page: input.page,
      limit: input.limit,
      searchKey: input.searchKey,
    );
  }
}
