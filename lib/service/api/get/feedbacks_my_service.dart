import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;

class FeedBacksMyService {
  static Future<List<FeedbacksMyModel>> getFeedbacksMyService() async {
    debugPrint("funksiya ishgaa tushdi");
    var res = await http.get(
      Uri.parse(
        BaseUrl.baseUrl + "/feedbacks/my",
      ),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
      },
    );
    debugPrint("funksiya bodydan otdi");
    try {
      debugPrint("funksiya try ga kirdi");
      if (res.statusCode == 200 || res.statusCode == 201) {
        // var ssasa = res.body[0]["card_encrypted"];
        debugPrint(
            """
res.body: ${res.body}
qrcode: ${GetStorage().read("qrcode")}
result: ${(jsonDecode(res.body) as List).map((e) => FeedbacksMyModel.fromJson(e)).toList()}
""");

        return (jsonDecode(res.body) as List)
            .map((e) => FeedbacksMyModel.fromJson(e))
            .toList();
      } else {
        debugPrint("funksiya else ga otib ketti");
        throw "Error";
      }
    } catch (e) {
      debugPrint("funksiya catchga otirb ketti");
      debugPrint(e.toString());
      return (jsonDecode(res.body) as List)
          .map((e) => FeedbacksMyModel.fromJson(e))
          .toList();
    }
  }
}
