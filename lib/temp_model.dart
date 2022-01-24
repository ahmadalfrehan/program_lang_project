// To parse this JSON data, do
//
//     final tempModel = tempModelFromJson(jsonString);

import 'dart:convert';

TempModel tempModelFromJson(String str) => TempModel.fromJson(json.decode(str));

String tempModelToJson(TempModel data) => json.encode(data.toJson());

class TempModel {
  TempModel({
  //  required this.id,
   required this.token,
  });

  // late int id;
  late String token;

  factory TempModel.fromJson(Map<String, dynamic> json) => TempModel(
    // id: json["id"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "token": token,
  };
}
