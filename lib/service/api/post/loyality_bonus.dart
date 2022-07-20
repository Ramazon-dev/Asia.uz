import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;

class LoyalityBonusService {
  static Future loyalityBonusService(String bonus) async {
    print('qrNumber :$bonus');
    var response = await http.post(
      Uri.parse(
        BaseUrl.baseUrl + '/loyalty/bonus',
      ),
      headers: {
        'token': GetStorage().read("token"),
      },
      body: {
        "card_number": bonus,
      },
    );
    debugPrint("response: $response");
    debugPrint("resposne.body : ${response.body}");
    int status = jsonDecode(response.body)["statusCode"];
    String message = jsonDecode(response.body)["message"];
    debugPrint("status: $status");
    debugPrint("message: $message");
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        // String token = data['access_token'];
        // bool verify = data["is_verified"];
        // debugPrint("access_token : $token");
        // debugPrint("is verified: $verify");
        // await GetStorage().write('token', token);
        // debugPrint("if ichida response : ${response.body}");
        int status = data["statusCode"];

        debugPrint(data.toString());
        return status;
      } else {
        int status = jsonDecode(response.body)["statusCode"];
        debugPrint("Esle ga kirdi $status");

        return status;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
