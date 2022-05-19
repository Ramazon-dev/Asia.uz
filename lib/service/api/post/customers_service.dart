// import 'package:asia_uz/core/imports/imports.dart';
// import 'package:http/http.dart' as http;

// class CustomersServices {
//   static Future cuspomersService({
//     required String phoneNumber,
//     required String dob,
//     required String firstName,
//     required String lastName,
//     required String gender,
//     required bool materialStatus,
//     required String notificationLanguage,
//     required String notificationPreference,
//     required String occupation,
//   }) async {
//     debugPrint("token kep turibti mana${GetStorage().read('token')}");
//     debugPrint("""
// mobile_phone: $phoneNumber
// firstname: $firstName,
// lastNeme: $lastName,
// dob: $dob,
// gender: $gender,
// maritalStatus: $materialStatus,
// occupation: $occupation,
// notificationPreference: $notificationPreference,
// notificationLanguage: $notificationLanguage,
// """);
//     var response = await http.post(
//       Uri.parse(BaseUrl.baseUrl + '/customers'),
//       headers: {
//         'Authorization': "Bearer ${GetStorage().read('token')}",
//       },
//       body: {
//         "first_name": "Ramazon",
//         "last_name": "Tojiboyev",
//         "dob": "19/01/1999",
//         "marital_status": materialStatus,
//         "gender": "male",
//         "occupation": "occupation",
//         "notification_preference": "sms",
//         "notification_language": "russian",
//       },
//     );

//     try {
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var data = jsonDecode(response.body);
//         debugPrint("Res qaytdi $data");
//         return data;
//       } else {
//         throw 'error';
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
// }

import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;

class CustomersServices {
  static Future<CustomersGetModels> cuspomersService({
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
    CustomersGetModels customersGetModels;
    var res = await http.post(
      Uri.parse(
        BaseUrl.baseUrl + '/customers',
      ),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
        // 'Content-Type': 'application/json'
      },
      body: {
        "first_name": firstName,
        "last_name": lastName,
        "dob": dob,
        // "marital_status": true,
        "gender": gender,
        "occupation": occupation,
        "notification_preference": notificationPreference,
        "notification_language": notificationPreference
      },
    );
    try {
      if (res.statusCode == 200 || res.statusCode == 201) {
        var data = jsonDecode(res.body);
        debugPrint("ifga kirdi: $res");
        debugPrint("resposnce keldi mana: ${res.body}");
        customersGetModels = CustomersGetModels.fromJson(jsonDecode(res.body));
        GetStorage().write("qrcode", customersGetModels.card!.cardEncrypted);
        GetStorage()
            .write("totalBalance", customersGetModels.card!.totalBalance);
        GetStorage().write("history", customersGetModels.card!.history);

        debugPrint("""
qrcode: ${GetStorage().read("qrcode")}
totalBalance: ${GetStorage().read("totalBalance")}
history: ${GetStorage().read("history")}
""");
      } else {
        throw "error";
      }
    } catch (e) {
      debugPrint(e.toString());
      return customersGetModels =
          CustomersGetModels.fromJson(jsonDecode(res.body));
    }
    return customersGetModels =
        CustomersGetModels.fromJson(jsonDecode(res.body));
  }
}

// class CustomersServicess {
//   static Future<CustomersGetModels> cuspomersService({
//     required String phoneNumber,
//     required String dob,
//     required String firstName,
//     required String lastName,
//     required String gender,
//     required bool materialStatus,
//     required String notificationLanguage,
//     required String notificationPreference,
//     required String occupation,
//   }) async {
//     var response = await http.post(
//       Uri.parse('https://asia-uz.herokuapp.com/customers'),
//       headers: {
//         'Authorization': 'Bearer ${GetStorage().read('token')}',
//         'Content-Type': 'application/json'
//       },
//       body: {
//         "first_name": firstName,
//         "last_name": lastName,
//         "dob": dob,
//         "marital_status": true,
//         "gender": gender,
//         "occupation": occupation,
//         "notification_preference": notificationPreference,
//         "notification_language": notificationPreference
//       },
//     );
//     log("loggoooo: ${response}");
//     debugPrint("aaaaaaaaaaaaaaaaaa: ${response.body}");
//     if (response.statusCode == 201) {
//       var data = jsonDecode(response.body);
//       debugPrint("ifga kirdi");

//       CustomersGetModels customersGetModels = CustomersGetModels.fromJson(data);
//       debugPrint("curtomer get dan otdi");
//       GetStorage().write("qrcode", customersGetModels.card!.cardEncrypted);
//       debugPrint("getstorage ga yozdi");

//       debugPrint("dddddddddd ${GetStorage().read("qrcode")}");
//       return customersGetModels;
//       //  ! JUNIYOR qovun  customersGetModels olasiz malumotlarni customersGetModels.customer
//     } else {
//       throw 'error';
//     }
//   }
// }

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
