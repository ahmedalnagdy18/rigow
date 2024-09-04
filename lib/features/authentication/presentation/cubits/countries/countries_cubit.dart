import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/city_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/countries_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/states_entity.dart';
import 'package:rigow/features/authentication/domain/usecases/register_part_usecase/complete_profile_part/city_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/register_part_usecase/complete_profile_part/countries_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/register_part_usecase/complete_profile_part/states_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/countries/countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  final CountriesUsecase countriesUsecase;
  final StatesUsecase statesUsecase;
  final CityUsecase cityUsecase;

  CountriesCubit(
      {required this.cityUsecase,
      required this.statesUsecase,
      required this.countriesUsecase})
      : super(CountriesInitial());

  void countries(CountriesEntity countryEntity) async {
    emit(LoadingCountriesState());
    try {
      final data = await countriesUsecase.call(countryEntity);
      emit(SucsessCountriesState(countriesItems: data));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorCountriesState(message: e.message));
      }
      rethrow;
    }
    emit(CountriesInitial());
  }

  void states(StatesEntity statesEntity) async {
    emit(LoadingStatesState());
    try {
      final data = await statesUsecase.call(statesEntity);
      emit(SucsessStatesState(statesItems: data));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorStatesState(message: e.message));
      }
      rethrow;
    }
  }

  void cities(CityEntity cityEntity) async {
    emit(LoadingCityState());
    try {
      final data = await cityUsecase.call(cityEntity);
      emit(SucsessCityState(cityItems: data));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorCityState(message: e.message));
      }
      rethrow;
    }
  }
}
