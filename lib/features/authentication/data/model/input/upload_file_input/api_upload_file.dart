import 'package:rigow/features/authentication/domain/entities/upload_entity/upload_photo_input.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_upload_file.g.dart';

@JsonSerializable()
class ApiUploadFileInput {
  final String file;
  final String model;

  ApiUploadFileInput({required this.file, required this.model});

  factory ApiUploadFileInput.frominput(UploadFiledInput input) {
    return ApiUploadFileInput(file: input.file, model: input.model);
  }

  Map<String, dynamic> toJson() => _$ApiUploadFileInputToJson(this);
}
