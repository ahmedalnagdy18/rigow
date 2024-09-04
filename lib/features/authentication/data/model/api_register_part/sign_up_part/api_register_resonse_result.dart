import 'dart:convert';

class ApiRegisterResponseResult {
  final Register? register;

  ApiRegisterResponseResult({
    this.register,
  });

  factory ApiRegisterResponseResult.fromRawJson(String str) =>
      ApiRegisterResponseResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiRegisterResponseResult.fromJson(Map<String, dynamic> json) =>
      ApiRegisterResponseResult(
        register: json["register"] == null
            ? null
            : Register.fromJson(json["register"]),
      );

  Map<String, dynamic> toJson() => {
        "register": register?.toJson(),
      };
}

class Register {
  final bool? success;
  final int? code;
  final String? message;
  final bool? data;

  Register({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory Register.fromRawJson(String str) =>
      Register.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": data,
      };
}
