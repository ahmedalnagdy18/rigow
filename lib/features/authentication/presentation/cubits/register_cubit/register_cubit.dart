import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/register_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/send_email_verification.dart';
import 'package:rigow/features/authentication/presentation/cubits/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;
  final SendEmailVerificationCodeUsecase sendEmailVerificationCodeUsecase;
  RegisterCubit(
      {required this.sendEmailVerificationCodeUsecase,
      required this.registerUsecase})
      : super(RegisterInitial());

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
      } else {
        emit(const ErrorRegsisterState(message: "Error"));
      }
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
      } else {
        emit(const ErrorEmailVerificationCodeState(message: "Error"));
      }
    }
  }
}
