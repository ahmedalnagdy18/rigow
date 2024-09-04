import 'package:rigow/features/authentication/data/model/api_specialty.dart';

class SpecialtyModel {
  final int id;
  final String name;

  SpecialtyModel({required this.id, required this.name});
  @override
  String toString() {
    return 'CountriesModel(id: $id, name: $name)';
  }
}

extension PoostItems on Item {
  SpecialtyModel reviewMap() {
    return SpecialtyModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}
