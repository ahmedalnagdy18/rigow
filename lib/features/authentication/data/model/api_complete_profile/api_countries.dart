import 'dart:convert';

class ApiCountries {
  final Countries? countries;

  ApiCountries({
    this.countries,
  });

  factory ApiCountries.fromRawJson(String str) =>
      ApiCountries.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiCountries.fromJson(Map<String, dynamic> json) => ApiCountries(
        countries: json["countries"] == null
            ? null
            : Countries.fromJson(json["countries"]),
      );

  Map<String, dynamic> toJson() => {
        "countries": countries?.toJson(),
      };
}

class Countries {
  final Data? data;

  Countries({
    this.data,
  });

  factory Countries.fromRawJson(String str) =>
      Countries.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
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
