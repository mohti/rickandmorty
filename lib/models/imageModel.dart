// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

ImageModel userModelFromJson(String str) =>
    ImageModel.fromJson(json.decode(str));

String userModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel  {
  ImageModel({
    this.name,
    this.url,
    this.location,
  });

  String name;
  String url;
  String location;
  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
      name: json["name"],
      url: json["image"],
      location: json["location"]["name"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "location": location,
      };
}
