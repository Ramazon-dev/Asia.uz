import 'package:asia_uz/core/constants/base/base_url.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;

class CuspomersServices {
  static Future cuspomersService(
    String firstName,
    String lastName,
    String email,
    String landline,
    String backupPhone,
    String dop,
    bool materialStatus,
    String gemder,
    String occupation,
    String notificationPreference,
    String notificationLanguage,
  ) async {
    var response = await http.post(
      Uri.parse(BaseUrl.baseUrl + '/customers'),
      headers: {
        'token': 'token',
      },
      body: {
        "first_name": "$firstName",
        "last_name": "$lastName",
        "email": "$email",
        "landline": "$landline",
        "backup_phone": "$backupPhone",
        "dob": "$dop",
        "marital_status": "$materialStatus",
        "gender": "$gemder",
        "occupation": "$occupation",
        "notification_preference": "$notificationPreference",
        "notification_language": "$notificationLanguage"
      },
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        throw 'error';
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
