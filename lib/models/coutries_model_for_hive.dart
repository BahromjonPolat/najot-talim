// To parse this JSON data, do
//
//     final welcome1 = welcome1FromJson(jsonString);

import 'dart:convert';
import 'package:hive/hive.dart';

part 'coutries_model_for_hive.g.dart';

@HiveType(typeId: 1)
class CountriesModelForHive {
  CountriesModelForHive({
    this.code,
    this.name,
    this.phone,
    this.continent,
    this.capital,
    this.currency,
    this.emoji,
  });
  @HiveField(0)
  String? code;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  Continent? continent;
  @HiveField(4)
  String? capital;
  @HiveField(5)
  String? currency;
  @HiveField(6)
  String? emoji;

  factory CountriesModelForHive.fromJson(Map<String, dynamic> json) =>
      CountriesModelForHive(
        code: json["code"],
        name: json["name"],
        phone: json["phone"],
        continent: Continent.fromJson(json["continent"]),
        capital: json["capital"],
        currency: json["currency"],
        emoji: json["emoji"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "phone": phone,
        "continent": continent!.toJson(),
        "capital": capital,
        "currency": currency,
        "emoji": emoji,
      };
}
@HiveType(typeId: 2)
class Continent {
  Continent({
    this.code,
    this.name,
  });
  @HiveField(0)
  String? code;
  @HiveField(1)
  String? name;

  factory Continent.fromJson(Map<String, dynamic> json) => Continent(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}
