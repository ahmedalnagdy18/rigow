import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/countries_entity.dart';
import 'package:rigow/features/authentication/domain/model/city_model.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/domain/model/states_model.dart';

abstract class CountriesState extends Equatable {
  @override
  List<Object> get props => [];
}

final class CountriesInitial extends CountriesState {}

class LoadingCountriesState extends CountriesState {}

class SucsessCountriesState extends CountriesState {
  final PaginatedData<CountriesModel> countriesItems;

  SucsessCountriesState({required this.countriesItems});
  @override
  List<Object> get props => [countriesItems];
}

class ErrorCountriesState extends CountriesState {
  final String message;

  ErrorCountriesState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingStatesState extends CountriesState {}

class SucsessStatesState extends CountriesState {
  final List<StatesModel> statesItems;

  SucsessStatesState({required this.statesItems});
  @override
  List<Object> get props => [statesItems];
}

class ErrorStatesState extends CountriesState {
  final String message;

  ErrorStatesState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingCityState extends CountriesState {}

class SucsessCityState extends CountriesState {
  final List<CityModel> cityItems;

  SucsessCityState({required this.cityItems});
  @override
  List<Object> get props => [cityItems];
}

class ErrorCityState extends CountriesState {
  final String message;

  ErrorCityState({required this.message});

  @override
  List<Object> get props => [message];
}
