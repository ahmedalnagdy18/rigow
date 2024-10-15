import 'dart:convert';

class ApiLogout {
  final Logout? logout;

  ApiLogout({
    this.logout,
  });

  factory ApiLogout.fromRawJson(String str) =>
      ApiLogout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiLogout.fromJson(Map<String, dynamic> json) => ApiLogout(
        logout: json["logout"] == null ? null : Logout.fromJson(json["logout"]),
      );

  Map<String, dynamic> toJson() => {
        "logout": logout?.toJson(),
      };
}

class Logout {
  final bool? data;
  final int? code;
  final bool? success;
  final String? message;

  Logout({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory Logout.fromRawJson(String str) => Logout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Logout.fromJson(Map<String, dynamic> json) => Logout(
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
