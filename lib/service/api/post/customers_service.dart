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
    debugPrint("token kep turibti mana${GetStorage().read('token')}");
    debugPrint(
        """
mobile_phone: $phoneNumber
firstname: $firstName,
lastNeme: $lastName,
dob: $dob,
gender: $gender,
maritalStatus: $materialStatus,
occupation: $occupation,
notificationPreference: $notificationPreference,
notificationLanguage: $notificationLanguage,
""");
    var response = await http.post(
      Uri.parse(BaseUrl.baseUrl + '/customers'),
      headers: {
        'Authorization': "Bearer ${GetStorage().read('token')}",
      },
      body: {
        "first_name": firstName,
        "last_name": lastName,
        "dob": dob,
        "marital_status": "$materialStatus",
        "gender": gender,
        "occupation": occupation,
        "notification_preference": notificationPreference,
        "notification_language": notificationLanguage,
      },
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        debugPrint("Res qaytdi $data");
        return data;
      } else {
        throw 'error';
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
