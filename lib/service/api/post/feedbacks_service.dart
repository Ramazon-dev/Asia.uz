import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;

class FeedbacksService {
  static Future feedbacksService({
    required String type,
    required String message,
  }) async {
    debugPrint(
      "feedbacksService api iwga tushdi message: $message, type: $type",
    );
    var res = await http.post(
      Uri.parse(
        BaseUrl.baseUrl + "/feedbacks",
      ),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
      },
      body: {"type": type, "message": message},
    );
    debugPrint("bodydan otdi");
    try {
      debugPrint("try ga kirdi res.statusCode: ${res.statusCode}");
      if (res.statusCode == 200 || res.statusCode == 201) {
        var data = jsonDecode(res.body);
        debugPrint("res.body: ${res.body} and data: $data");
        return data;
      } else {
        throw "error";
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
