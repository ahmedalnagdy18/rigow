import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/validate_username_input.dart';
import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_input.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/validate_username_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/upload_usecase/upload_photo_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/user_complete_profile/complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  final ValidateUsernameUsecase validateUsernameUsecase;
  final UploadFileUsecase uploadFileUsecase;
  CompleteProfileCubit(
      {required this.uploadFileUsecase, required this.validateUsernameUsecase})
      : super(CompleteInitial());

  void validateUsername(ValidateUsernameInput validateUsernameEntity) async {
    emit(LoadingValidateUsernameState());

    try {
      await validateUsernameUsecase.call(validateUsernameEntity);
      emit(SucsessValidateUsernameState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorValidateUsernameState(message: e.message));
      } else {
        emit(const ErrorValidateUsernameState(message: "Error"));
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
