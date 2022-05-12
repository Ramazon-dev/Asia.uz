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
