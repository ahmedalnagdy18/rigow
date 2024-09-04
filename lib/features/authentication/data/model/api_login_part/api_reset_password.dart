import 'dart:convert';

class ApiResetPasswordByEmail {
  final ResetPasswordByEmail? resetPasswordByEmail;

  ApiResetPasswordByEmail({
    this.resetPasswordByEmail,
  });

  factory ApiResetPasswordByEmail.fromRawJson(String str) =>
      ApiResetPasswordByEmail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiResetPasswordByEmail.fromJson(Map<String, dynamic> json) =>
      ApiResetPasswordByEmail(
        resetPasswordByEmail: json["resetPasswordByEmail"] == null
            ? null
            : ResetPasswordByEmail.fromJson(json["resetPasswordByEmail"]),
      );

  Map<String, dynamic> toJson() => {
        "resetPasswordByEmail": resetPasswordByEmail?.toJson(),
      };
}

class ResetPasswordByEmail {
  final bool? data;
  final int? code;
  final bool? success;
  final String? message;

  ResetPasswordByEmail({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory ResetPasswordByEmail.fromRawJson(String str) =>
      ResetPasswordByEmail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResetPasswordByEmail.fromJson(Map<String, dynamic> json) =>
      ResetPasswordByEmail(
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
