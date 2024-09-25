import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_profile_user_input.dart';
import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_input.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/complete_profile_user_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/upload_usecase/upload_photo_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_user_complete_profile/main_complete_profile_state.dart';

class MainCompleteProfileCubit extends Cubit<MainCompleteProfileState> {
  final CompleteProfileUserUsecase completeProfileUserUsecase;
  final UploadFileUsecase uploadFileUsecase;

  MainCompleteProfileCubit(
      {required this.uploadFileUsecase,
      required this.completeProfileUserUsecase})
      : super(MainCompleteInitial());

  void getAllUserData(
      CompleteProfileUserInput completeProfileUserEntity) async {
    emit(LoadingCompleteProfileUserState());

    try {
      final String profilePicture = await uploadFile(
        UploadFiledInput(
          file: completeProfileUserEntity.profilePicture,
          model: "PROFILE_PICTURE",
        ),
      );

      completeProfileUserEntity =
          completeProfileUserEntity.copyWith(profilePicture: profilePicture);

      await completeProfileUserUsecase.call(completeProfileUserEntity);
      emit(SucsessCompleteProfileUserState(
          uploadedProfileImage: profilePicture));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorCompleteProfileUserState(message: e.message));
      } else {
        emit(const ErrorCompleteProfileUserState(message: "Error"));
      }
    }
  }

  Future<String> uploadFile(UploadFiledInput uploadFiledEntity) async {
    emit(LoadingUploadFileState());
    try {
      String filePath = await uploadFileUsecase.call(uploadFiledEntity);
      emit(SucsessUploadFileState());
      return filePath;
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorUploadFileState(message: e.message));
      }
      rethrow;
    }
  }
}
