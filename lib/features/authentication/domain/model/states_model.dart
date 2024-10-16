import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/data/model/api_complete_profile/api_states.dart';

class StatesModel extends Equatable {
  final int id;
  final String name;

  const StatesModel({required this.id, required this.name});
  @override
  String toString() {
    return 'StatesModel(id: $id, name: $name)';
  }

  @override
  List<Object?> get props => [id, name];
}

extension PoostItems on Item {
  StatesModel reviewMap() {
    return StatesModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}
