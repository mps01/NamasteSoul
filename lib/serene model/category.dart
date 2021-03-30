import 'dart:convert';
import 'dart:ui';

import 'package:antara/config/assets.dart';
import 'package:antara/serene%20model/sound.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

List<Category> categoryFromJson(String str) => List<Category>.from(
    json.decode(str).map((category) => Category.fromJson(category)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((category) => category.toJson())));

class Category {
  String id;
  String title;
  String icon;
  List<Sound> sounds;
  Color color;

  Category(
      {@required this.id,
      @required this.title,
      @required this.icon,
      @required this.sounds,
      this.color});

  Category copyWith({
    String id,
    String title,
    Color color,
    String icon,
    List<Sound> sounds,
  }) =>
      Category(
        id: id ?? this.id,
        title: title ?? this.title,
        color: color ?? this.color,
        icon: icon ?? this.icon,
        sounds: sounds ?? this.sounds,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        icon: Assets.baseImagesPath + json["icon"],
        color: getCategoryColor(json["id"]),
        sounds: List<Sound>.from(json["sounds"].map((sound) =>
            Sound.fromJson(sound).copyWith(
                icon: Assets.baseImagesPath +
                    json["title"].toLowerCase() +
                    "/" +
                    sound["icon"], // ex: assets/images/city/ic_airplane.png
                audio: Assets.baseSoundsPath + sound["audio"],
                color: getCategoryColor(json["id"])))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "sounds": List<dynamic>.from(sounds.map((sound) => sound.toJson())),
      };
}

Color getCategoryColor(String categoryId) {
  Color color = null;
  switch (categoryId) {
    case "1":
      {
        color = Color(0xFFC592F3);
      }
      break;
    case "2":
      {
        color = Color(0xFFF5B97E);
      }
      break;
    case "3":
      {
        color = Color(0xFFA8E087);
      }
      break;
    case "4":
      {
        color = Color(0xFF91E7F6);
      }
      break;
    default:
      Color(0xFFF5B97E);
  }
  return color;
}
