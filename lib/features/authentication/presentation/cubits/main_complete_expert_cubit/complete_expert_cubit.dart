import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_input.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/complete_expert_profile_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/upload_usecase/upload_photo_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_complete_expert_cubit/complete_expert_state.dart';

class CompleteExpertCubit extends Cubit<CompleteExpertState> {
  final CompleteExpertProfileUsecase completeExpertProfileUsecase;
  final UploadFileUsecase uploadFileUsecase;

  CompleteExpertCubit(
      {required this.uploadFileUsecase,
      required this.completeExpertProfileUsecase})
      : super(CompleteExpertInitial());

  void setExpertData(
      CompleteExpertProfileInput completeExpertProfileInput) async {
    emit(LoadingCompleteExpertState());
    try {
      await completeExpertProfileUsecase.call(completeExpertProfileInput);
      emit(SucsessCompleteExpertState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorCompleteExpertState(message: e.message));
      }
      rethrow;
    }
  }

  Future<String> uploadExpertFile(UploadFiledInput uploadFiledEntity) async {
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
