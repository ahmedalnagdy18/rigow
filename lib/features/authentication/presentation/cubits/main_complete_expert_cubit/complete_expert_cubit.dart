import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_entity.dart';
import 'package:rigow/features/authentication/domain/usecases/register_part_usecase/complete_profile_part/complete_expert_profile_usecase.dart';
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

  Future<String> uploadExpertFile(UploadFiledEntity uploadFiledEntity) async {
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
