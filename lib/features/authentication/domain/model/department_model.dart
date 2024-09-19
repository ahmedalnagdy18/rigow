import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/data/model/api_complete_profile/api_department.dart';

class DepartmentModel extends Equatable {
  final int? id;
  final String name;

  const DepartmentModel({required this.id, required this.name});
  @override
  String toString() {
    return 'DepartmentModel(id: $id, name: $name)';
  }

  @override
  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

extension DepartmentItems on ApiDepartmentItem {
  DepartmentModel reviewMap() {
    return DepartmentModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}
