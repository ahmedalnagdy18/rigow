import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/data/model/api_complete_profile/api_city.dart';

class CityModel extends Equatable {
  final int id;
  final String name;

  const CityModel({required this.id, required this.name});
  @override
  String toString() {
    return 'CityModel(id: $id, name: $name)';
  }

  @override
  List<Object?> get props => [id, name];
}

extension CityItems on Item {
  CityModel reviewMap() {
    return CityModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}
