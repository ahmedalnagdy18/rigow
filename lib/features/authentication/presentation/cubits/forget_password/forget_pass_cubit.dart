import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/forget_pass_entity.dart';
import 'package:rigow/features/authentication/domain/entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/usecases/login_part_usecase/forget_pass_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/send_email_verification.dart';
import 'package:rigow/features/authentication/presentation/cubits/forget_password/forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  final ForgetPassUsecase forgetPassUsecase;
  final SendEmailVerificationCodeUsecase sendEmailVerificationCodeUsecase;
  ForgetPassCubit(
      {required this.sendEmailVerificationCodeUsecase,
      required this.forgetPassUsecase})
      : super(ForgetPassInitial());

  void forget(ForgetPassEntity forgetPassEntity) async {
    emit(LoadingForgetPass());
    try {
      await forgetPassUsecase.call(forgetPassEntity: forgetPassEntity);
      emit(SucsessForgetPass());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorForgetPass(message: e.message));
      }
      rethrow;
    }
  }

  void sendEmailVerificationCode(
      SendEmailVerificationCodeEntity sendEmailVerificationCodeEntity) async {
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
