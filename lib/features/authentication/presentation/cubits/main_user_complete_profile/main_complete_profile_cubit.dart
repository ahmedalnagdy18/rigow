import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_profile_user_entity.dart';
import 'package:rigow/features/authentication/domain/usecases/register_part_usecase/complete_profile_part/complete_profile_user_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_user_complete_profile/main_complete_profile_state.dart';

class MainCompleteProfileCubit extends Cubit<MainCompleteProfileState> {
  final CompleteProfileUserUsecase completeProfileUserUsecase;
  MainCompleteProfileCubit({required this.completeProfileUserUsecase})
      : super(MainCompleteInitial());

  void getAllUserData(
      CompleteProfileUserInput completeProfileUserEntity) async {
    emit(LoadingCompleteProfileUserState());

    try {
      await completeProfileUserUsecase.call(completeProfileUserEntity);
      emit(SucsessCompleteProfileUserState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorCompleteProfileUserState(message: e.message));
      }
      rethrow;
    }
  }
}