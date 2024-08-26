import 'package:rigow/features/authentication/data/model/api_states.dart';

class StatesModel {
  final int id;
  final String name;

  StatesModel({required this.id, required this.name});
  @override
  String toString() {
    return 'StatesModel(id: $id, name: $name)';
  }
}

extension PoostItems on Item {
  StatesModel reviewMap() {
    return StatesModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}
