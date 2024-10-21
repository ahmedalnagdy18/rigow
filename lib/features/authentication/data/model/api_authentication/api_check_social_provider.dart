import 'dart:convert';

class ApiCheckSocialProvider {
  final CheckSocialProviderStatus? checkSocialProviderStatus;

  ApiCheckSocialProvider({
    this.checkSocialProviderStatus,
  });

  factory ApiCheckSocialProvider.fromRawJson(String str) =>
      ApiCheckSocialProvider.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiCheckSocialProvider.fromJson(Map<String, dynamic> json) =>
      ApiCheckSocialProvider(
        checkSocialProviderStatus: json["checkSocialProviderStatus"] == null
            ? null
            : CheckSocialProviderStatus.fromJson(
                json["checkSocialProviderStatus"]),
      );

  Map<String, dynamic> toJson() => {
        "checkSocialProviderStatus": checkSocialProviderStatus?.toJson(),
      };
}

class CheckSocialProviderStatus {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  CheckSocialProviderStatus({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory CheckSocialProviderStatus.fromRawJson(String str) =>
      CheckSocialProviderStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckSocialProviderStatus.fromJson(Map<String, dynamic> json) =>
      CheckSocialProviderStatus(
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
  final String? actionRequired;
  final User? user;

  Data({
    this.actionRequired,
    this.user,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        actionRequired: json["actionRequired"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "actionRequired": actionRequired,
        "user": user?.toJson(),
      };
}

class User {
  final String? token;

  User({
    this.token,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
