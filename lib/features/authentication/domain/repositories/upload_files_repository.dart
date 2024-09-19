import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_entity.dart';

abstract class UploadFileRepository {
  Future<String> uploadfile(UploadFiledEntity uploadFiledEntity);
}
