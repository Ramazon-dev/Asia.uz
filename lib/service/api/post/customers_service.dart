import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;

class CustomersServices {
  static Future cuspomersService({
    required String phoneNumber,
    required String dob,
    required String firstName,
    required String lastName,
    required String gender,
    required bool materialStatus,
    required String notificationLanguage,
    required String notificationPreference,
    required String occupation,
  }) async {
    var headers = {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('https://asia-uz.herokuapp.com/customers'));
    request.body = json.encode({
      "first_name": "$firstName",
      "last_name": "$lastName",
      "dob": "$dob",
      "marital_status": true,
      "gender": "$gender",
      "occupation": "$occupation",
      "notification_preference": "$notificationPreference",
      "notification_language": "$notificationPreference"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}

class CustomersServicess {
  static Future cuspomersService({
    required String phoneNumber,
    required String dob,
    required String firstName,
    required String lastName,
    required String gender,
    required bool materialStatus,
    required String notificationLanguage,
    required String notificationPreference,
    required String occupation,
  }) async {
    var response = await http.post(
      Uri.parse('https://asia-uz.herokuapp.com/customers'),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
        'Content-Type': 'application/json'
      },
      body: {
        "first_name": "$firstName",
        "last_name": "$lastName",
        "dob": "$dob",
        "marital_status": true,
        "gender": "$gender",
        "occupation": "$occupation",
        "notification_preference": "$notificationPreference",
        "notification_language": "$notificationPreference"
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      CustomersGetModels customersGetModels = CustomersGetModels.fromJson(data);
      return customersGetModels;
      //  ! JUNIYOR qovun  customersGetModels olasiz malumotlarni customersGetModels.customer
    } else {
      throw 'error';
    }
  }
}

CustomersGetModels customersGetModelsFromJson(String str) =>
    CustomersGetModels.fromJson(json.decode(str));

String customersGetModelsToJson(CustomersGetModels data) =>
    json.encode(data.toJson());

class CustomersGetModels {
  CustomersGetModels({
    this.customer,
    this.card,
  });

  Customer? customer;
  Card? card;

  factory CustomersGetModels.fromJson(Map<String, dynamic> json) =>
      CustomersGetModels(
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
