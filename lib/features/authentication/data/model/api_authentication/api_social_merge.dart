import 'dart:convert';

class ApiSocialMerge {
  final SocialMerge? socialMerge;

  ApiSocialMerge({
    this.socialMerge,
  });

  factory ApiSocialMerge.fromRawJson(String str) =>
      ApiSocialMerge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiSocialMerge.fromJson(Map<String, dynamic> json) => ApiSocialMerge(
        socialMerge: json["socialMerge"] == null
            ? null
            : SocialMerge.fromJson(json["socialMerge"]),
      );

  Map<String, dynamic> toJson() => {
        "socialMerge": socialMerge?.toJson(),
      };
}

class SocialMerge {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  SocialMerge({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory SocialMerge.fromRawJson(String str) =>
      SocialMerge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SocialMerge.fromJson(Map<String, dynamic> json) => SocialMerge(
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
  final String? profilePicture;
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
