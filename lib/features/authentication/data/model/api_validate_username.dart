import 'dart:convert';

class ApiValidateUsername {
  final ValidateUsername? validateUsername;

  ApiValidateUsername({
    this.validateUsername,
  });

  factory ApiValidateUsername.fromRawJson(String str) =>
      ApiValidateUsername.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiValidateUsername.fromJson(Map<String, dynamic> json) =>
      ApiValidateUsername(
        validateUsername: json["validateUsername"] == null
            ? null
            : ValidateUsername.fromJson(json["validateUsername"]),
      );

  Map<String, dynamic> toJson() => {
        "validateUsername": validateUsername?.toJson(),
      };
}

class ValidateUsername {
  final bool? data;
  final int? code;
  final bool? success;
  final String? message;

  ValidateUsername({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory ValidateUsername.fromRawJson(String str) =>
      ValidateUsername.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ValidateUsername.fromJson(Map<String, dynamic> json) =>
      ValidateUsername(
        data: json["data"],
        code: json["code"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "code": code,
        "success": success,
        "message": message,
      };
}
