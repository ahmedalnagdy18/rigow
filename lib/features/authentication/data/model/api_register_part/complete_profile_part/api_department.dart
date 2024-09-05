import 'dart:convert';

class ApiDepartments {
  final Departments? departments;

  ApiDepartments({
    this.departments,
  });

  factory ApiDepartments.fromRawJson(String str) =>
      ApiDepartments.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiDepartments.fromJson(Map<String, dynamic> json) => ApiDepartments(
        departments: json["departments"] == null
            ? null
            : Departments.fromJson(json["departments"]),
      );

  Map<String, dynamic> toJson() => {
        "departments": departments?.toJson(),
      };
}

class Departments {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  Departments({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory Departments.fromRawJson(String str) =>
      Departments.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Departments.fromJson(Map<String, dynamic> json) => Departments(
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
  final List<Item>? items;

  Data({
    this.items,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  final int? id;
  final String? name;

  Item({
    this.id,
    this.name,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
