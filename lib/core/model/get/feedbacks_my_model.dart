class FeedbacksMyModel {
  FeedbacksMyModel({
    this.id,
    this.customerId,
    this.type,
    this.message,
    this.platform,
    this.createdAt,
    this.updatedAt,
    this.feedbackId,
    this.v,
  });

  String? id;
  String? customerId;
  String? type;
  String? message;
  String? platform;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? feedbackId;
  int? v;

  factory FeedbacksMyModel.fromJson(Map<String, dynamic> json) =>
      FeedbacksMyModel(
        id: json["_id"],
        customerId: json["customer_id"],
        type: json["type"],
        message: json["message"],
        platform: json["platform"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        feedbackId: json["feedback_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "customer_id": customerId,
        "type": type,
        "message": message,
        "platform": platform,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "feedback_id": feedbackId,
        "__v": v,
      };
}
