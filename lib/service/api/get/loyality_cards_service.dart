import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;

class LoyalityCardsService {
  static Future<List<LoyalityCardsModel>> getLoyalityCardsService() async {
    debugPrint("get loyality funksiya ishgaa tushdi");
    var res = await http.get(
      Uri.parse(
        BaseUrl.baseUrl + "/loyalty/cards",
      ),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
      },
    );
    debugPrint("get loyality funksiya bodydan otdi");
    try {
      debugPrint("get loyality funksiya try ga kirdi");
      if (res.statusCode == 200 || res.statusCode == 201) {
        // var ssasa = res.body[0]["card_encrypted"];
        var data = jsonDecode(res.body);
        final qrcodeeee = data[0]["card_encrypted"];
        final history = data[0]["history"];
        final totalBalance = data[0]["total_balance"];
        GetStorage().write("qrcode", qrcodeeee);
        GetStorage().write("totalBalance", totalBalance);

        debugPrint("""
res.body: ${res.body}
data: $data
qrcode:$qrcodeeee
history: $history
totalBallance: $totalBalance
qrcode: ${GetStorage().read("qrcode")}
""");
        return (jsonDecode(res.body) as List)
            .map((e) => LoyalityCardsModel.fromJson(e))
            .toList();
      } else {
        debugPrint("get loyality funksiya else ga otib ketti");
        throw "Error";
      }
    } catch (e) {
      debugPrint("get loyality funksiya catchga otirb ketti");
      debugPrint(e.toString());
      return (jsonDecode(res.body) as List)
          .map((e) => LoyalityCardsModel.fromJson(e))
          .toList();
    }
  }
}
