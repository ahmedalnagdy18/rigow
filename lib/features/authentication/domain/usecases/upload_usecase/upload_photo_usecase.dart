import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_input.dart';
import 'package:rigow/features/authentication/domain/repositories/upload_files_repository.dart';

class UploadFileUsecase {
  final UploadFileRepository repository;

  UploadFileUsecase({required this.repository});
  Future<String> call(UploadFiledInput uploadFiledEntity) async {
    return await repository.uploadfile(uploadFiledEntity);
  }
}
