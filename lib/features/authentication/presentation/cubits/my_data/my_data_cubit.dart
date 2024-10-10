import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/my_data_inputs.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/my_data_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_state.dart';

class MyDataCubit extends Cubit<MyDataState> {
  final MyDataUsecase myDataUsecase;

  MyDataCubit({required this.myDataUsecase}) : super(MyDataInitial());

  UserDataEntity? get userData =>
      state is SucsessMyDataState ? (state as SucsessMyDataState).myData : null;
  // to acces the data without provider

  void getUserDataInfo() async {
    try {
      emit(LoadingMyDataState());

      final result = await myDataUsecase.call();
      emit(SucsessMyDataState(myData: result));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorMyDataState(message: e.message));
      } else {
        emit(const ErrorMyDataState(message: "Error"));
      }
    }
  }
}
