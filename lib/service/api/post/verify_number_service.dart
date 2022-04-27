
import 'package:http/http.dart' as http;
import 'package:asia_uz/core/imports/imports.dart';

class VerifyNumberService {
  static Future verifyNumberService(int phoneNumber) async {
    var response = await http.post(
      Uri.parse(BaseUrl.baseUrl + '/customers/verify-number'),
      headers: {
        'token': 'token',
      },
      body: {
        "verify-number": "$phoneNumber",
      },
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        bool status = data['status'];
        debugPrint('response : ${response.body}');
        return data;
      } else {
        throw 'ERROR';
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
