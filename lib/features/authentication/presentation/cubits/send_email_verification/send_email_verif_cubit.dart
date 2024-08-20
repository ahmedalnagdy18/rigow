import 'package:flutter_bloc/flutter_bloc.dart';
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
      await verifyUserUsecase.call(verifyUserEntity);
      emit(SucsessVerifyUserState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorVerifyUserState(message: e.message));
      }
      rethrow;
    }
  }
}
