import 'dart:convert';

class ApiSpecialties {
  final Specialties? specialties;

  ApiSpecialties({
    this.specialties,
  });

  factory ApiSpecialties.fromRawJson(String str) =>
      ApiSpecialties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiSpecialties.fromJson(Map<String, dynamic> json) => ApiSpecialties(
        specialties: json["specialties"] == null
            ? null
            : Specialties.fromJson(json["specialties"]),
      );

  Map<String, dynamic> toJson() => {
        "specialties": specialties?.toJson(),
      };
}

class Specialties {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  Specialties({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory Specialties.fromRawJson(String str) =>
      Specialties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Specialties.fromJson(Map<String, dynamic> json) => Specialties(
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
