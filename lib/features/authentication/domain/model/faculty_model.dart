import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_faculty.dart';

class FacultyModel {
  final int id;
  final String name;

  FacultyModel({required this.id, required this.name});

  @override
  String toString() {
    return 'CountriesModel(id: $id, name: $name)';
  }
}

extension FacultyItems on Item {
  FacultyModel reviewMap() {
    return FacultyModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}
