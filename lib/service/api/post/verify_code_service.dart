import 'package:asia_uz/core/constants/base/base_url.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;

class VerifyCodeService {
  static Future verifyCodeService(int verifyCode) async {
    var response = await http.post(
      Uri.parse(
        BaseUrl.baseUrl + '/customers/verify-code',
      ),
      headers: {
        'token': 'token',
      },
      body: {
        "verify-code": "$verifyCode",
      },
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        bool status = data['status'];
        debugPrint("response : ${response.body}");
        return data;
      } else {
        throw 'error';
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
