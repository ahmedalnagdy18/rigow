import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_user_input.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/verify_user_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/verify_email_verification/send_email_verif_state.dart';

class VerifyUserCubit extends Cubit<VerifyUserState> {
  final VerifyUserUsecase verifyUserUsecase;
  final SendEmailVerificationCodeUsecase sendEmailVerificationCodeUsecase;
  VerifyUserCubit(
      {required this.verifyUserUsecase,
      required this.sendEmailVerificationCodeUsecase})
      : super(VerifyUserInitial());

  void verifyUser(VerifyUserInput verifyUserEntity) async {
    emit(LoadingVerifyUserState());

    try {
      final result = await verifyUserUsecase.call(verifyUserEntity);
      SharedPrefrance.instanc.setToken(key: 'token', token: result.token);
      emit(SucsessVerifyUserState(dataForComplete: result));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorVerifyUserState(message: e.message));
      } else {
        emit(const ErrorVerifyUserState(message: "Error"));
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
