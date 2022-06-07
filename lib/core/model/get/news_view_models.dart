import 'dart:convert';

NewsViewModels newsViewModelsFromJson(String str) => NewsViewModels.fromJson(json.decode(str));

String newsViewModelsToJson(NewsViewModels data) => json.encode(data.toJson());

class NewsViewModels {
    NewsViewModels({
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

    factory NewsViewModels.fromJson(Map<String, dynamic> json) => NewsViewModels(
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
