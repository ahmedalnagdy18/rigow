import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_register_input.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/social_register_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/social_register_cubit/social_register_state.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterState> {
  final SocialRegisterUsecase socialRegisterUsecase;

  SocialRegisterCubit({required this.socialRegisterUsecase})
      : super(SocialRegisterInitial());

  void socialRegisterFunc({
    required SocialRegisterInput input,
  }) async {
    try {
      emit(LoadingSocialRegisterState());

      await socialRegisterUsecase.execute(input);
      emit(SucsessSocialRegisterState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorSocialRegisterState(message: e.message));
      } else {
        emit(const ErrorSocialRegisterState(message: "Error"));
      }
    }
  }
}
