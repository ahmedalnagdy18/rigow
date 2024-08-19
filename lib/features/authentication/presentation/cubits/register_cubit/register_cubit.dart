import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/register_input.dart';
import 'package:rigow/features/authentication/domain/usecases/register_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterCubit({required this.registerUsecase}) : super(RegisterInitial());

  void registerFuc({
    required RegisterInput input,
  }) async {
    try {
      emit(LoadingRegsisterState());

      await registerUsecase.execute(input);
      emit(SucsessRegsisterState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorRegsisterState(message: e.message));
      }
      rethrow;
    }
  }
}
