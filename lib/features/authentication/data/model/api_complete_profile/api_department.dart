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
  final List<ApiDepartmentItem>? items;

  Data({
    this.items,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<ApiDepartmentItem>.from(
                json["items"]!.map((x) => ApiDepartmentItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class ApiDepartmentItem {
  final int? id;
  final String? name;

  ApiDepartmentItem({
    this.id,
    this.name,
  });

  factory ApiDepartmentItem.fromRawJson(String str) =>
      ApiDepartmentItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiDepartmentItem.fromJson(Map<String, dynamic> json) =>
      ApiDepartmentItem(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
