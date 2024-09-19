import 'dart:convert';

class ApiLogin {
  final EmailAndPasswordLogin? emailAndPasswordLogin;

  ApiLogin({
    this.emailAndPasswordLogin,
  });

  factory ApiLogin.fromRawJson(String str) =>
      ApiLogin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiLogin.fromJson(Map<String, dynamic> json) => ApiLogin(
        emailAndPasswordLogin: json["emailAndPasswordLogin"] == null
            ? null
            : EmailAndPasswordLogin.fromJson(json["emailAndPasswordLogin"]),
      );

  Map<String, dynamic> toJson() => {
        "emailAndPasswordLogin": emailAndPasswordLogin?.toJson(),
      };
}

class EmailAndPasswordLogin {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  EmailAndPasswordLogin({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory EmailAndPasswordLogin.fromRawJson(String str) =>
      EmailAndPasswordLogin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EmailAndPasswordLogin.fromJson(Map<String, dynamic> json) =>
      EmailAndPasswordLogin(
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

  Data({
    this.token,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
