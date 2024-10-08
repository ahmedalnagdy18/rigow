import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/all_user_data.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/login_input.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/login_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit({required this.loginUsecase}) : super(LoginInitial());

  void login(LoginInput loginEntity) async {
    emit(LoadingLoginState());
    try {
      final AllUserData userData = await loginUsecase.call(loginEntity);
      emit(SucsessLoginState(data: userData));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorLoginState(message: e.message));
      } else {
        emit(const ErrorLoginState(message: "Error"));
      }
    }
  }
}
