import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_forget_password_input.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/verify_forget_password_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/verify_forget_pass_cubit/verify_forget_state.dart';

class VerifyForgetCubit extends Cubit<VerifyForgetState> {
  final VerifyForgetPasswordUsecase verifyForgetPasswordUsecase;
  final SendEmailVerificationCodeUsecase sendEmailVerificationCodeUsecase;
  VerifyForgetCubit(
      {required this.verifyForgetPasswordUsecase,
      required this.sendEmailVerificationCodeUsecase})
      : super(VerifyForgetInitial());

  void verifyForgetPassword(
      VerifyForgetPasswordInput verifyForgetPasswordEntity) async {
    emit(LoadingVerifyForgetState());

    try {
      await verifyForgetPasswordUsecase.call(verifyForgetPasswordEntity);
      emit(SucsessVerifyForgetState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorVerifyForgetState(message: e.message));
      }
      rethrow;
    }
  }

  void sendEmailVerificationCode(
      SendEmailVerificationCodeInput sendEmailVerificationCodeEntity) async {
    emit(LoadingEmailVerificationCodeState());
    try {
      await sendEmailVerificationCodeUsecase
          .call(sendEmailVerificationCodeEntity);
      emit(SucsessEmailVerificationCodeState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorEmailVerificationCodeState(message: e.message));
      }
      rethrow;
    }
  }
}
