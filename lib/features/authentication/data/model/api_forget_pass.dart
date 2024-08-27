import 'dart:convert';

class ApiForgetPassword {
  final ForgetPassword? forgetPassword;

  ApiForgetPassword({
    this.forgetPassword,
  });

  factory ApiForgetPassword.fromRawJson(String str) =>
      ApiForgetPassword.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiForgetPassword.fromJson(Map<String, dynamic> json) =>
      ApiForgetPassword(
        forgetPassword: json["forgetPassword"] == null
            ? null
            : ForgetPassword.fromJson(json["forgetPassword"]),
      );

  Map<String, dynamic> toJson() => {
        "forgetPassword": forgetPassword?.toJson(),
      };
}

class ForgetPassword {
  final bool? data;
  final int? code;
  final bool? success;
  final String? message;

  ForgetPassword({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory ForgetPassword.fromRawJson(String str) =>
      ForgetPassword.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgetPassword.fromJson(Map<String, dynamic> json) => ForgetPassword(
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
