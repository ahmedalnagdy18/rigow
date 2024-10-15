import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/check_social_provider_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_login_input.dart';
import 'package:rigow/features/authentication/domain/model/social_login_model.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/check_social_provider_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/social_login_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/check_social_login/check_social_login_state.dart';

class CheckSocialLoginCubit extends Cubit<CheckSocialLoginState> {
  final CheckSocialProviderUsecase checkSocialProviderUsecase;
  final SocialLoginUsecase socialLoginUsecase;

  CheckSocialLoginCubit(
      {required this.socialLoginUsecase,
      required this.checkSocialProviderUsecase})
      : super(CheckSocialInitial());

  void checkSocialFunc({required CheckSocialProviderInput input}) async {
    try {
      emit(LoadingCheckSocialState());

      final result = await checkSocialProviderUsecase.execute(input);
      emit(SucsessCheckSocialState(myData: result));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorCheckSocialState(message: e.message));
      } else {
        emit(const ErrorCheckSocialState(message: "Error"));
      }
    }
  }

  void socialLogin({required SocialLoginInput input}) async {
    try {
      emit(LoadingSocialLoginState());
      final SocialLoginModel result = await socialLoginUsecase.execute(input);
      emit(SucsessSocialLoginState(myData: result));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorSocialLoginState(message: e.message));
      } else {
        emit(const ErrorSocialLoginState(message: "Error"));
      }
    }
  }
}
