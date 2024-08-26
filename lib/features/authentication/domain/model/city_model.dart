import 'package:rigow/features/authentication/data/model/api_city.dart';

class CityModel {
  final int id;
  final String name;

  CityModel({required this.id, required this.name});
  @override
  String toString() {
    return 'CityModel(id: $id, name: $name)';
  }
}

extension CityItems on Item {
  CityModel reviewMap() {
    return CityModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}
