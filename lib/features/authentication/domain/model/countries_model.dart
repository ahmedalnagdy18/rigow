import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/data/model/api_complete_profile/api_countries.dart';

class CountriesModel extends Equatable {
  final int id;
  final String name;

  const CountriesModel({required this.id, required this.name});

  @override
  String toString() {
    return 'CountriesModel(id: $id, name: $name)';
  }

  @override
  List<Object?> get props => [id, name];
}

extension PoostItems on Item {
  CountriesModel reviewMap() {
    return CountriesModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}
