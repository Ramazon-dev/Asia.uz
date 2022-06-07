import 'dart:convert';

List<NewsModels> newsModelsFromJson(String str) => List<NewsModels>.from(json.decode(str).map((x) => NewsModels.fromJson(x)));

String newsModelsToJson(List<NewsModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModels {
  NewsModels({
    this.id,
    this.type,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? type;
  String? title;
  String? description;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory NewsModels.fromJson(Map<String, dynamic> json) => NewsModels(
    id: json["_id"],
    type: json["type"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "type": type,
    "title": title,
    "description": description,
    "image": image,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}
