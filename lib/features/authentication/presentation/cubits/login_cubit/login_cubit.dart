import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/login_entity.dart';
import 'package:rigow/features/authentication/domain/usecases/login_part_usecase/login_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit({required this.loginUsecase}) : super(LoginInitial());

  void login(LoginEntity loginEntity) async {
    emit(LoadingLoginState());
    try {
      await loginUsecase.call(loginEntity);
      emit(SucsessLoginState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorLoginState(message: e.message));
      }
      rethrow;
    }
  }
}
