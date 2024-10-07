import 'dart:convert';

class ApiSocialRegister {
  final SocialRegister? socialRegister;

  ApiSocialRegister({
    this.socialRegister,
  });

  factory ApiSocialRegister.fromRawJson(String str) =>
      ApiSocialRegister.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiSocialRegister.fromJson(Map<String, dynamic> json) =>
      ApiSocialRegister(
        socialRegister: json["socialRegister"] == null
            ? null
            : SocialRegister.fromJson(json["socialRegister"]),
      );

  Map<String, dynamic> toJson() => {
        "socialRegister": socialRegister?.toJson(),
      };
}

class SocialRegister {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  SocialRegister({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory SocialRegister.fromRawJson(String str) =>
      SocialRegister.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SocialRegister.fromJson(Map<String, dynamic> json) => SocialRegister(
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
  final String? firstName;
  final String? id;
  final String? lastName;

  Data({
    this.firstName,
    this.id,
    this.lastName,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["firstName"],
        id: json["id"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "id": id,
        "lastName": lastName,
      };
}
