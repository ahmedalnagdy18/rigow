import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/domain/entities/verify_user_entity.dart';
import 'package:rigow/features/authentication/domain/usecases/verify_user_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/send_email_verification/send_email_verif_state.dart';

class VerifyUserCubit extends Cubit<VerifyUserState> {
  final VerifyUserUsecase verifyUserUsecase;
  VerifyUserCubit({required this.verifyUserUsecase})
      : super(VerifyUserInitial());

  void verifyUser(VerifyUserEntity verifyUserEntity) async {
    emit(LoadingVerifyUserState());

    try {
      final result = await verifyUserUsecase.call(verifyUserEntity);
      SharedPrefrance.instanc.setToken(key: 'token', token: result.token);
      emit(SucsessVerifyUserState(dataForComplete: result));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorVerifyUserState(message: e.message));
      }
      rethrow;
    }
  }
}
