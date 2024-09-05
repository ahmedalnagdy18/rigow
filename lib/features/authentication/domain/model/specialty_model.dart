import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_specialty.dart';

class SpecialtyModel extends Equatable {
  final int id;
  final String name;

  const SpecialtyModel({
    required this.id,
    required this.name,
  });
  @override
  String toString() {
    return 'SpecialtyModel(id: $id, name: $name)';
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

extension PoostItems on Item {
  SpecialtyModel reviewMap() {
    return SpecialtyModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}
