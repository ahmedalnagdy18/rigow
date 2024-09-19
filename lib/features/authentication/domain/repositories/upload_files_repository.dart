import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_input.dart';

abstract class UploadFileRepository {
  Future<String> uploadfile(UploadFiledInput uploadFiledEntity);
}
