import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_countries.dart';

class CountriesModel {
  final int id;
  final String name;

  CountriesModel({required this.id, required this.name});

  @override
  String toString() {
    return 'CountriesModel(id: $id, name: $name)';
  }
}

extension PoostItems on Item {
  CountriesModel reviewMap() {
    return CountriesModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}