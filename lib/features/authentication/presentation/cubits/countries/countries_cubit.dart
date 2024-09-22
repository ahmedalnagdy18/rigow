import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/city_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/countries_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/states_input.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/city_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/countries_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/states_usecase.dart';
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

  void countries(CountriesInput countryEntity) async {
    emit(LoadingCountriesState());
    try {
      final data = await countriesUsecase.call(countryEntity);
      emit(SucsessCountriesState(countriesItems: data));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorCountriesState(message: e.message));
      } else {
        emit(ErrorCountriesState(message: "Error"));
      }
    }
    emit(CountriesInitial());
  }

  void states(StatesInput statesEntity) async {
    emit(LoadingStatesState());
    try {
      final data = await statesUsecase.call(statesEntity);
      emit(SucsessStatesState(statesItems: data));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorStatesState(message: e.message));
      } else {
        emit(ErrorStatesState(message: "Error"));
      }
    }
  }

  void cities(CityInput cityEntity) async {
    emit(LoadingCityState());
    try {
      final data = await cityUsecase.call(cityEntity);
      emit(SucsessCityState(cityItems: data));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorCityState(message: e.message));
      } else {
        emit(ErrorCityState(message: "Error"));
      }
    }
  }
}
