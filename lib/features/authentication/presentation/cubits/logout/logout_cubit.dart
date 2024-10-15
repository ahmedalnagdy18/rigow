import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/logout_input.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/logout_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/logout/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUsecase logoutUsecase;
  String? token;
  LogoutCubit({required this.logoutUsecase}) : super(LogoutInitial());

  void logoutFromAcc(LogoutInput input) async {
    emit(LoadingLogoutState());
    try {
      await logoutUsecase.call(input);
      await SharedPrefrance.instanc.removeFromShared(key: 'token');
      emit(SucsessLogoutState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorLogoutState(message: e.message));
      } else {
        emit(const ErrorLogoutState(message: "Error"));
      }
    }
  }
}
