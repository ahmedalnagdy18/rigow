import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_faculty.dart';

class FacultyModel extends Equatable {
  final int? id;
  final String name;

  const FacultyModel({
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return 'FacultyModel(id: $id, name: $name)';
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

extension FacultyItems on Item {
  FacultyModel reviewMap() {
    return FacultyModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}
