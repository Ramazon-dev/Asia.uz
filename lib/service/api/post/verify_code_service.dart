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
        bool verify = data["is_verified"];
        debugPrint("access_token : $token");
        debugPrint("is verified: $verify");
        await GetStorage().write('token', token);
        debugPrint("if ichida response : ${response.body}");
        return verify.toString();
      } else {
        debugPrint("verify code service else ga kirdi");
        throw 'error';
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("catch ga kirib ketti");
      return null.toString();
    }
  }
}
