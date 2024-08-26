import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/city_entity.dart';
import 'package:rigow/features/authentication/domain/entities/countries_entity.dart';
import 'package:rigow/features/authentication/domain/entities/states_entity.dart';
import 'package:rigow/features/authentication/domain/usecases/city_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/countries_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/states_usecase.dart';
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
