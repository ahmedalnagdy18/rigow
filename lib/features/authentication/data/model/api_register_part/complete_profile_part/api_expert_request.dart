import 'dart:convert';

class ApiExpertRequest {
  final CreateExpertRequest? createExpertRequest;

  ApiExpertRequest({
    this.createExpertRequest,
  });

  factory ApiExpertRequest.fromRawJson(String str) =>
      ApiExpertRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiExpertRequest.fromJson(Map<String, dynamic> json) =>
      ApiExpertRequest(
        createExpertRequest: json["createExpertRequest"] == null
            ? null
            : CreateExpertRequest.fromJson(json["createExpertRequest"]),
      );

  Map<String, dynamic> toJson() => {
        "createExpertRequest": createExpertRequest?.toJson(),
      };
}

class CreateExpertRequest {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  CreateExpertRequest({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory CreateExpertRequest.fromRawJson(String str) =>
      CreateExpertRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateExpertRequest.fromJson(Map<String, dynamic> json) =>
      CreateExpertRequest(
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
  final dynamic token;
  final String? firstName;
  final String? lastName;
  final String? profilePicture;

  Data({
    this.token,
    this.firstName,
    this.lastName,
    this.profilePicture,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture,
      };
}
