class UploadFiledEntity {
  final String file;
  final String model;

  UploadFiledEntity({required this.file, required this.model});

  toJson() {
    return {
      "file": file,
      "model": model,
    };
  }
}
