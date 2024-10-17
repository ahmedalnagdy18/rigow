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
      final String profilePicture = await uploadExpertFile(
        UploadFiledInput(
          file: completeExpertProfileInput.profilePicture,
          model: "PROFILE_PICTURE",
        ),
      );
      final String universityDegreeUrl = await uploadExpertFile(
        UploadFiledInput(
          file: completeExpertProfileInput.universityDegreeUrl,
          model: "EXPERT_DOCUMENT",
        ),
      );
      final List<String> uploadedCertificates = [];
      for (String certificate in completeExpertProfileInput.otherCertificates) {
        if (certificate.isNotEmpty) {
          final String uploadedCertificate = await uploadExpertFile(
            UploadFiledInput(
              file: certificate,
              model: "EXPERT_DOCUMENT",
            ),
          );
          uploadedCertificates.add(uploadedCertificate);
        }
      }
      String? governmentPermitUrl;
      if (completeExpertProfileInput.governmentPermitUrl.isNotEmpty) {
        governmentPermitUrl = await uploadExpertFile(
          UploadFiledInput(
            file: completeExpertProfileInput.governmentPermitUrl,
            model: "EXPERT_DOCUMENT",
          ),
        );
      }

      final String nationalIdFront = await uploadExpertFile(
        UploadFiledInput(
          file: completeExpertProfileInput.nationalIdFront,
          model: "EXPERT_DOCUMENT",
        ),
      );

      final String nationalIdBack = await uploadExpertFile(
        UploadFiledInput(
          file: completeExpertProfileInput.nationalIdBack,
          model: "EXPERT_DOCUMENT",
        ),
      );

      completeExpertProfileInput = completeExpertProfileInput.copyWith(
        profilePicture: profilePicture,
        universityDegreeUrl: universityDegreeUrl,
        otherCertificates: uploadedCertificates,
        governmentPermitUrl: governmentPermitUrl,
        nationalIdFront: nationalIdFront,
        nationalIdBack: nationalIdBack,
      );

      await completeExpertProfileUsecase.call(completeExpertProfileInput);
      emit(SucsessCompleteExpertState(
        uploadedProfileImage: profilePicture,
      ));
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
