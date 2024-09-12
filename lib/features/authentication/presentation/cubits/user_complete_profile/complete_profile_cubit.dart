import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/validate_username_entity.dart';
import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_entity.dart';
import 'package:rigow/features/authentication/domain/usecases/register_part_usecase/complete_profile_part/validate_username_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/upload_usecase/upload_photo_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/user_complete_profile/complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  final ValidateUsernameUsecase validateUsernameUsecase;
  final UploadFileUsecase uploadFileUsecase;
  CompleteProfileCubit(
      {required this.uploadFileUsecase, required this.validateUsernameUsecase})
      : super(CompleteInitial());

  void validateUsername(ValidateUsernameEntity validateUsernameEntity) async {
    emit(LoadingValidateUsernameState());

    try {
      await validateUsernameUsecase.call(validateUsernameEntity);
      emit(SucsessValidateUsernameState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorValidateUsernameState(message: e.message));
      }
      rethrow;
    }
  }

  void uploadFile(UploadFiledEntity uploadFiledEntity) async {
    emit(LoadingUploadFileState());
    try {
      await uploadFileUsecase.call(uploadFiledEntity);
      emit(SucsessUploadFileState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorUploadFileState(message: e.message));
      }
      rethrow;
    }
  }
}
