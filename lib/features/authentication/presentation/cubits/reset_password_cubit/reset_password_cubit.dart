import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/reset_password_entity.dart';
import 'package:rigow/features/authentication/domain/usecases/reset_password_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/reset_password_cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUsecase resetPasswordUsecase;
  ResetPasswordCubit({required this.resetPasswordUsecase})
      : super(ResetPasswordInitial());

  void resetPassword(ResetPasswordEntity resetPasswordEntity) async {
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
