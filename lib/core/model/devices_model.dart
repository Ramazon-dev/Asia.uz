class DevicesModel {
  DevicesModel({
    this.customerId,
    this.token,
    this.platform,
  });

  CustomerId? customerId;
  String? token;
  String? platform;

  factory DevicesModel.fromJson(Map<String, dynamic> json) => DevicesModel(
        customerId: CustomerId.fromJson(json["customer_id"]),
        token: json["token"],
        platform: json["platform"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId!.toJson(),
        "token": token,
        "platform": platform,
      };
}

class CustomerId {
  CustomerId();

  factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId();

  Map<String, dynamic> toJson() => {};
}
