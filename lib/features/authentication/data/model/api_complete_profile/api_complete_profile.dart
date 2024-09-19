import 'dart:convert';

class ApiCompleteProfileAsUser {
  final CompleteProfileAsUser? completeProfileAsUser;

  ApiCompleteProfileAsUser({
    this.completeProfileAsUser,
  });

  factory ApiCompleteProfileAsUser.fromRawJson(String str) =>
      ApiCompleteProfileAsUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiCompleteProfileAsUser.fromJson(Map<String, dynamic> json) =>
      ApiCompleteProfileAsUser(
        completeProfileAsUser: json["completeProfileAsUser"] == null
            ? null
            : CompleteProfileAsUser.fromJson(json["completeProfileAsUser"]),
      );

  Map<String, dynamic> toJson() => {
        "completeProfileAsUser": completeProfileAsUser?.toJson(),
      };
}

class CompleteProfileAsUser {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  CompleteProfileAsUser({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory CompleteProfileAsUser.fromRawJson(String str) =>
      CompleteProfileAsUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CompleteProfileAsUser.fromJson(Map<String, dynamic> json) =>
      CompleteProfileAsUser(
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
  final String? lastName;
  final String? id;

  Data({
    this.firstName,
    this.lastName,
    this.id,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["firstName"],
        lastName: json["lastName"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "id": id,
      };
}
