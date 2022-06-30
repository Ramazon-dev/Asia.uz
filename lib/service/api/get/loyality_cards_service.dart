import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/model/get/loyality_cards_model.dart';
import 'package:http/http.dart' as http;

class LoyalityCardsService {
  static Future<List<LoyalityCardsModel>> getLoyalityCardsService() async {
    debugPrint("funksiya ishgaa tushdi");
    var res = await http.get(
      Uri.parse(
        BaseUrl.baseUrl + "/loyalty/cards",
      ),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
      },
    );
    debugPrint("funksiya bodydan otdi");
    try {
      debugPrint("funksiya try ga kirdi");
      if (res.statusCode == 200 || res.statusCode == 201) {
        var data = jsonDecode(res.body);
        var ssasa = data[0]['total_balance'];
        var balance = data[0]['history'];
        var qrcode = data[0]['card_encrypted'];
        GetStorage().write("qrcode", data['card_encrypted']);
        debugPrint("""
res.body:${res.body}
data:$data
history: $ssasa
total ballance: $balance 
qrcode: $qrcode
""");
        return (jsonDecode(res.body) as List)
            .map((e) => LoyalityCardsModel.fromJson(e))
            .toList();
      } else {
        debugPrint("funksiya else ga otib ketti");
        throw "Error";
      }
    } catch (e) {
      debugPrint("funksiya catchga otirb ketti");
      debugPrint(e.toString());
      return (jsonDecode(res.body) as List)
          .map((e) => LoyalityCardsModel.fromJson(e))
          .toList();
    }
  }
}
