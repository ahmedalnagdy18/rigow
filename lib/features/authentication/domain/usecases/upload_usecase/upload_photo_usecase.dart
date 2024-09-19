import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/upload_files_repository.dart';

class UploadFileUsecase {
  final UploadFileRepository repository;

  UploadFileUsecase({required this.repository});
  Future<String> call(UploadFiledEntity uploadFiledEntity) async {
    return await repository.uploadfile(uploadFiledEntity);
  }
}
