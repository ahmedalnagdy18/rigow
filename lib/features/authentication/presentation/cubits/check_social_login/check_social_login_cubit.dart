import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/check_social_provider_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_login_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_merge_input.dart';
import 'package:rigow/features/authentication/domain/model/social_login_model.dart';
import 'package:rigow/features/authentication/domain/model/social_merge_model.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/check_social_provider_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/social_login_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/social_merge_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/check_social_login/check_social_login_state.dart';

class CheckSocialLoginCubit extends Cubit<CheckSocialLoginState> {
  final CheckSocialProviderUsecase checkSocialProviderUsecase;
  final SocialLoginUsecase socialLoginUsecase;
  final SocialMergeUsecase socialMergeUsecase;

  CheckSocialLoginCubit({
    required this.socialLoginUsecase,
    required this.checkSocialProviderUsecase,
    required this.socialMergeUsecase,
  }) : super(CheckSocialInitial());

  void checkSocialFunc({required CheckSocialProviderInput input}) async {
    try {
      emit(LoadingCheckSocialState());

      final result = await checkSocialProviderUsecase.execute(input);
      emit(SucsessCheckSocialState(myData: result));
    } catch (e) {
      emit(ErrorCheckSocialState(message: e.toString()));
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

  void socialMerge({required SocialMergeInput input}) async {
    try {
      emit(LoadingSocialMergeState());
      final SocialMergeModel result = await socialMergeUsecase.execute(input);
      emit(SucsessSocialMergeState(myData: result));
    } catch (e) {
      emit(ErrorSocialMergeState(message: e.toString()));
    }
  }
}
