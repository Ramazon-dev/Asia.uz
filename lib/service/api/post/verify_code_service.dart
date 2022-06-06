import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;

class VerifyCodeService {
  static Future verifyCodeService(int verifyCode, String number) async {
    print('veritify :$verifyCode');
    var response = await http.post(
      Uri.parse(
        BaseUrl.baseUrl + '/customers/verify-code',
      ),
      headers: {
        'token': 'token',
      },
      body: {
        "number": GetStorage().read('telNumber'),
        "code": "$verifyCode",
      },
    );
    debugPrint("response: $response");
    debugPrint("resposne.body : ${response.body}");

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        String token = data['access_token'];
        debugPrint("access_token : $token");
        await GetStorage().write('token', token);
        debugPrint("if ichida response : ${response.body}");
        // return data;
      } else {
        throw 'error';
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
