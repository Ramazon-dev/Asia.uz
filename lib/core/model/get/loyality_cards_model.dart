class LoyalityCardsModel {
  LoyalityCardsModel({
    this.totalBalance,
    this.history,
    this.cardEncrypted,
  });

  double? totalBalance;
  List<History>? history;
  String? cardEncrypted;

  factory LoyalityCardsModel.fromJson(Map<String, dynamic> json) =>
      LoyalityCardsModel(
        totalBalance: json["total_balance"].toDouble(),
        history:
            List<History>.from(json["history"].map((x) => History.fromJson(x))),
        cardEncrypted: json["card_encrypted"],
      );

  Map<String, dynamic> toJson() => {
        "total_balance": totalBalance,
        "history": List<dynamic>.from(history!.map((x) => x.toJson())),
        "card_encrypted": cardEncrypted,
      };
}

class History {
  History({
    this.amount,
    this.shop,
    this.operation,
    this.createdAt,
    this.id,
  });

  double? amount;
  String? shop;
  String? operation;
  DateTime? createdAt;
  String? id;

  factory History.fromJson(Map<String, dynamic> json) => History(
        amount: json["amount"].toDouble(),
        shop: json["shop"],
        operation: json["operation"],
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "shop": shop,
        "operation": operation,
        "createdAt": createdAt!.toIso8601String(),
        "_id": id == null ? null : id,
      };
}
