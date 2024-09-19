import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/reset_password_input.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/reset_password_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/reset_password_cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUsecase resetPasswordUsecase;
  ResetPasswordCubit({required this.resetPasswordUsecase})
      : super(ResetPasswordInitial());

  void resetPassword(ResetPasswordInput resetPasswordEntity) async {
    emit(LoadingResetPasswordState());
    try {
      await resetPasswordUsecase.call(resetPasswordEntity);
      emit(SucsessResetPasswordtate());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorResetPasswordState(message: e.message));
      }
      rethrow;
    }
  }
}
