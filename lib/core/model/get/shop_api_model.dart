class ShopsModel {
  ShopsModel({
    this.id,
    this.shopId,
    this.name,
    this.city,
    this.address,
    this.longitude,
    this.latitude,
    this.v,
    this.contact,
    this.workingHours,
  });

  String? id;
  int? shopId;
  String? name;
  String? city;
  String? address;
  String? longitude;
  String? latitude;
  int? v;
  String? contact;
  String? workingHours;

  factory ShopsModel.fromJson(Map<String, dynamic> json) => ShopsModel(
        id: json["_id"],
        shopId: json["shop_id"],
        name: json["name"],
        city: json["city"],
        address: json["address"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        v: json["__v"],
        contact: json["contact"] == null ? null : json["contact"],
        workingHours:
            json["working_hours"] == null ? null : json["working_hours"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "shop_id": shopId,
        "name": name,
        "city": city,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "__v": v,
        "contact": contact == null ? null : contact,
        "working_hours": workingHours == null ? null : workingHours,
      };
}
