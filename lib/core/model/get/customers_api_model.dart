class CustomersApiModel {
  CustomersApiModel({
    this.customer,
    this.card,
  });

  Customer? customer;
  Card? card;

  factory CustomersApiModel.fromJson(Map<String, dynamic> json) => CustomersApiModel(
        customer: Customer.fromJson(json["customer"]),
        card: Card.fromJson(json["card"]),
      );

  Map<String, dynamic> toJson() => {
        "customer": customer!.toJson(),
        "card": card!.toJson(),
      };
}

class Card {
  Card({
    this.totalBalance,
    this.cardEncrypted,
    this.history,
  });

  int? totalBalance;
  String? cardEncrypted;
  List<dynamic>? history;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        totalBalance: json["total_balance"],
        cardEncrypted: json["card_encrypted"],
        history: List<dynamic>.from(json["history"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "total_balance": totalBalance,
        "card_encrypted": cardEncrypted,
        "history": List<dynamic>.from(history!.map((x) => x)),
      };
}

class Customer {
  Customer({
    this.mobilePhone,
    this.dob,
    this.firstName,
    this.gender,
    this.lastName,
    this.maritalStatus,
    this.notificationLanguage,
    this.notificationPreference,
    this.occupation,
  });

  String? mobilePhone;
  String? dob;
  String? firstName;
  String? gender;
  String? lastName;
  bool? maritalStatus;
  String? notificationLanguage;
  String? notificationPreference;
  String? occupation;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        mobilePhone: json["mobile_phone"],
        dob: json["dob"],
        firstName: json["first_name"],
        gender: json["gender"],
        lastName: json["last_name"],
        maritalStatus: json["marital_status"],
        notificationLanguage: json["notification_language"],
        notificationPreference: json["notification_preference"],
        occupation: json["occupation"],
      );

  Map<String, dynamic> toJson() => {
        "mobile_phone": mobilePhone,
        "dob": dob,
        "first_name": firstName,
        "gender": gender,
        "last_name": lastName,
        "marital_status": maritalStatus,
        "notification_language": notificationLanguage,
        "notification_preference": notificationPreference,
        "occupation": occupation,
      };
}
