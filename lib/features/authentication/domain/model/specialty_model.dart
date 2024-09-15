import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/complete_profile_part/api_specialty.dart';

class SpecialtyModel extends Equatable {
  final int id;
  final String name;
  final bool governmentPermitRequired;

  const SpecialtyModel(
      {required this.id,
      required this.name,
      required this.governmentPermitRequired});
  @override
  String toString() {
    return 'SpecialtyModel(id: $id, name: $name ,governmentPermitRequired: $governmentPermitRequired )';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        governmentPermitRequired,
      ];
}

extension PoostItems on Item {
  SpecialtyModel reviewMap() {
    return SpecialtyModel(
      id: id ?? 0,
      name: name ?? "",
      governmentPermitRequired: governmentPermitRequired ?? false,
    );
  }
}
