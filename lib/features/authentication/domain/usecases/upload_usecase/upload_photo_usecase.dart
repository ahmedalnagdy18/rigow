import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class UploadFileUsecase {
  final UploadFileRepository repository;

  UploadFileUsecase({required this.repository});
  Future<void> call(UploadFiledEntity uploadFiledEntity) async {
    return await repository.uploadfile(uploadFiledEntity);
  }
}
