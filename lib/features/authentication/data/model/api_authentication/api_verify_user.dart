import 'dart:convert';

class ApiVerifyUserByEmail {
  final VerifyUserByEmail? verifyUserByEmail;

  ApiVerifyUserByEmail({
    this.verifyUserByEmail,
  });

  factory ApiVerifyUserByEmail.fromRawJson(String str) =>
      ApiVerifyUserByEmail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiVerifyUserByEmail.fromJson(Map<String, dynamic> json) =>
      ApiVerifyUserByEmail(
        verifyUserByEmail: json["verifyUserByEmail"] == null
            ? null
            : VerifyUserByEmail.fromJson(json["verifyUserByEmail"]),
      );

  Map<String, dynamic> toJson() => {
        "verifyUserByEmail": verifyUserByEmail?.toJson(),
      };
}

class VerifyUserByEmail {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  VerifyUserByEmail({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory VerifyUserByEmail.fromRawJson(String str) =>
      VerifyUserByEmail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyUserByEmail.fromJson(Map<String, dynamic> json) =>
      VerifyUserByEmail(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        code: json["code"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "code": code,
        "success": success,
        "message": message,
      };
}

class Data {
  final String? token;
  final String? firstName;
  final String? lastName;

  Data({
    this.token,
    this.firstName,
    this.lastName,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "firstName": firstName,
        "lastName": lastName,
      };
}
