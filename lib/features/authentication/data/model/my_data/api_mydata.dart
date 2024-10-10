import 'dart:convert';

class ApiMyData {
  final Me? me;

  ApiMyData({
    this.me,
  });

  factory ApiMyData.fromRawJson(String str) =>
      ApiMyData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiMyData.fromJson(Map<String, dynamic> json) => ApiMyData(
        me: json["me"] == null ? null : Me.fromJson(json["me"]),
      );

  Map<String, dynamic> toJson() => {
        "me": me?.toJson(),
      };
}

class Me {
  final ApiUserDataInfo? data;
  final int? code;
  final bool? success;
  final String? message;

  Me({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory Me.fromRawJson(String str) => Me.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Me.fromJson(Map<String, dynamic> json) => Me(
        data: json["data"] == null
            ? null
            : ApiUserDataInfo.fromJson(json["data"]),
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

class ApiUserDataInfo {
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? fullName;
  final String? phone;
  final String? gender;
  final String? role;
  final String? profilePicture;
  final bool? hasCompletedRegistration;
  final dynamic token;
  final int? followersCount;
  final int? followingsCount;
  final int? birthDate;
  final String? readableBirthDate;
  final int? createdAt;
  final String? readableCreatedAt;
  final dynamic expertRequestStatus;
  final bool? canPost;
  final bool? isFollowed;

  ApiUserDataInfo({
    this.firstName,
    this.lastName,
    this.username,
    this.fullName,
    this.phone,
    this.gender,
    this.role,
    this.profilePicture,
    this.hasCompletedRegistration,
    this.token,
    this.followersCount,
    this.followingsCount,
    this.birthDate,
    this.readableBirthDate,
    this.createdAt,
    this.readableCreatedAt,
    this.expertRequestStatus,
    this.canPost,
    this.isFollowed,
  });

  factory ApiUserDataInfo.fromRawJson(String str) =>
      ApiUserDataInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiUserDataInfo.fromJson(Map<String, dynamic> json) =>
      ApiUserDataInfo(
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        fullName: json["fullName"],
        phone: json["phone"],
        gender: json["gender"],
        role: json["role"],
        profilePicture: json["profilePicture"],
        hasCompletedRegistration: json["hasCompletedRegistration"],
        token: json["token"],
        followersCount: json["followersCount"],
        followingsCount: json["followingsCount"],
        birthDate: json["birthDate"],
        readableBirthDate: json["readableBirthDate"],
        createdAt: json["createdAt"],
        readableCreatedAt: json["readableCreatedAt"],
        expertRequestStatus: json["expertRequestStatus"],
        canPost: json["canPost"],
        isFollowed: json["isFollowed"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "fullName": fullName,
        "phone": phone,
        "gender": gender,
        "role": role,
        "profilePicture": profilePicture,
        "hasCompletedRegistration": hasCompletedRegistration,
        "token": token,
        "followersCount": followersCount,
        "followingsCount": followingsCount,
        "birthDate": birthDate,
        "readableBirthDate": readableBirthDate,
        "createdAt": createdAt,
        "readableCreatedAt": readableCreatedAt,
        "expertRequestStatus": expertRequestStatus,
        "canPost": canPost,
        "isFollowed": isFollowed,
      };
}
