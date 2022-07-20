class LoyalityCardsModel {
  LoyalityCardsModel({
    this.totalBalance,
    this.history,
    this.cardEncrypted,
  });

  dynamic totalBalance;
  List<dynamic>? history;
  String? cardEncrypted;

  factory LoyalityCardsModel.fromJson(Map<String, dynamic> json) =>
      LoyalityCardsModel(
        totalBalance: json["total_balance"],
        history: List<dynamic>.from(json["history"].map((x) => x)),
        cardEncrypted: json["card_encrypted"],
      );

  Map<String, dynamic> toJson() => {
        "total_balance": totalBalance,
        "history": List<dynamic>.from(history!.map((x) => x)),
        "card_encrypted": cardEncrypted,
      };
}
