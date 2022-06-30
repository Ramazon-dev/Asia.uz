class FeedbacksModel {
  FeedbacksModel({
    this.customerId,
    this.type,
    this.message,
  });

  CustomerId? customerId;
  String? type;
  String? message;

  factory FeedbacksModel.fromJson(Map<String, dynamic> json) => FeedbacksModel(
        customerId: CustomerId.fromJson(json["customer_id"]),
        type: json["type"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId!.toJson(),
        "type": type,
        "message": message,
      };
}

class CustomerId {
  CustomerId();

  factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId();

  Map<String, dynamic> toJson() => {};
}
