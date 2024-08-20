import 'dart:convert';

class ApiSendEmailVerificationCode {
  final SendEmailVerificationCode? sendEmailVerificationCode;

  ApiSendEmailVerificationCode({
    this.sendEmailVerificationCode,
  });

  factory ApiSendEmailVerificationCode.fromRawJson(String str) =>
      ApiSendEmailVerificationCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiSendEmailVerificationCode.fromJson(Map<String, dynamic> json) =>
      ApiSendEmailVerificationCode(
        sendEmailVerificationCode: json["sendEmailVerificationCode"] == null
            ? null
            : SendEmailVerificationCode.fromJson(
                json["sendEmailVerificationCode"]),
      );

  Map<String, dynamic> toJson() => {
        "sendEmailVerificationCode": sendEmailVerificationCode?.toJson(),
      };
}

class SendEmailVerificationCode {
  final bool? data;
  final int? code;
  final bool? success;
  final String? message;

  SendEmailVerificationCode({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory SendEmailVerificationCode.fromRawJson(String str) =>
      SendEmailVerificationCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SendEmailVerificationCode.fromJson(Map<String, dynamic> json) =>
      SendEmailVerificationCode(
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
