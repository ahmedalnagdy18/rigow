import 'dart:convert';

class ApiSocialLogin {
  final SocialLogin? socialLogin;

  ApiSocialLogin({
    this.socialLogin,
  });

  factory ApiSocialLogin.fromRawJson(String str) =>
      ApiSocialLogin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiSocialLogin.fromJson(Map<String, dynamic> json) => ApiSocialLogin(
        socialLogin: json["socialLogin"] == null
            ? null
            : SocialLogin.fromJson(json["socialLogin"]),
      );

  Map<String, dynamic> toJson() => {
        "socialLogin": socialLogin?.toJson(),
      };
}

class SocialLogin {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  SocialLogin({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory SocialLogin.fromRawJson(String str) =>
      SocialLogin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SocialLogin.fromJson(Map<String, dynamic> json) => SocialLogin(
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
  final String? id;
  final String? firstName;
  final dynamic profilePicture;
  final String? lastName;
  final String? token;

  Data({
    this.id,
    this.firstName,
    this.profilePicture,
    this.lastName,
    this.token,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["firstName"],
        profilePicture: json["profilePicture"],
        lastName: json["lastName"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "profilePicture": profilePicture,
        "lastName": lastName,
        "token": token,
      };
}
