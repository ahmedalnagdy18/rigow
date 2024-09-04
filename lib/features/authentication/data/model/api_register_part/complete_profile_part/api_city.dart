import 'dart:convert';

class ApiCities {
  final Cities? cities;

  ApiCities({
    this.cities,
  });

  factory ApiCities.fromRawJson(String str) =>
      ApiCities.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiCities.fromJson(Map<String, dynamic> json) => ApiCities(
        cities: json["cities"] == null ? null : Cities.fromJson(json["cities"]),
      );

  Map<String, dynamic> toJson() => {
        "cities": cities?.toJson(),
      };
}

class Cities {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  Cities({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory Cities.fromRawJson(String str) => Cities.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
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
  final String? name;
  final int? id;

  Item({
    this.name,
    this.id,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
