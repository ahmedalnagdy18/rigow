import 'dart:convert';

class ApiVerifyForgetPasswordCode {
  final VerifyForgetPasswordCode? verifyForgetPasswordCode;

  ApiVerifyForgetPasswordCode({
    this.verifyForgetPasswordCode,
  });

  factory ApiVerifyForgetPasswordCode.fromRawJson(String str) =>
      ApiVerifyForgetPasswordCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiVerifyForgetPasswordCode.fromJson(Map<String, dynamic> json) =>
      ApiVerifyForgetPasswordCode(
        verifyForgetPasswordCode: json["verifyForgetPasswordCode"] == null
            ? null
            : VerifyForgetPasswordCode.fromJson(
                json["verifyForgetPasswordCode"]),
      );

  Map<String, dynamic> toJson() => {
        "verifyForgetPasswordCode": verifyForgetPasswordCode?.toJson(),
      };
}

class VerifyForgetPasswordCode {
  final bool? data;
  final int? code;
  final bool? success;
  final String? message;

  VerifyForgetPasswordCode({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory VerifyForgetPasswordCode.fromRawJson(String str) =>
      VerifyForgetPasswordCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyForgetPasswordCode.fromJson(Map<String, dynamic> json) =>
      VerifyForgetPasswordCode(
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
