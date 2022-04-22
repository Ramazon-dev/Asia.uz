import 'dart:convert';

List<ShopsApiModel> shopsApiModelFromJson(String str) => List<ShopsApiModel>.from(json.decode(str).map((x) => ShopsApiModel.fromJson(x)));

String shopsApiModelToJson(List<ShopsApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopsApiModel {
    ShopsApiModel({
        this.id,
        this.shopId,
        this.city,
        this.address,
        this.longitude,
        this.latitude,
        this.v,
    });

    String? id;
    int? shopId;
    String? city;
    String? address;
    String? longitude;
    String? latitude;
    int? v;

    factory ShopsApiModel.fromJson(Map<String, dynamic> json) => ShopsApiModel(
        id: json["_id"],
        shopId: json["shop_id"],
        city: json["city"],
        address: json["address"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "shop_id": shopId,
        "city": city,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "__v": v,
    };
}
