class ShopsModel {
  ShopsModel({
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

  factory ShopsModel.fromJson(Map<String, dynamic> json) => ShopsModel(
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
