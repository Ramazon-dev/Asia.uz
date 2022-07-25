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
        debugPrint("status is: ${res.statusCode}");
        var son = (jsonDecode(res.body) as List)
            .map((e) => LoyalityCardsModel.fromJson(e))
            .toList();
        // var ssasa = res.body[0]["card_encrypted"];
        // var sabana = LoyalityCardsModel.fromJson(jsonDecode(res.body));
        debugPrint("res.body: ${son[0].cardEncrypted}");
        final cards = son.length;
        debugPrint("son lenth: $cards");
        final secondhistory = son[0].cardEncrypted;

        GetStorage().write("cards", son.length);

        double amount = 0;
        double vaqtincha = 0;
        // List<double?> list = son[0].history[0].amount;
        var data = jsonDecode(res.body);
        final qrcodeeee = data[0]["card_encrypted"];
        final history = data[0]["history"];
        final totalBalance = data[0]["total_balance"];
        GetStorage().write("qrcode", qrcodeeee);
        GetStorage().write("totalBalance", totalBalance);
        if (son[0].history!.isNotEmpty) {
          var yanason = son[0].history![0].createdAt;
          var nmadur = data[0]["history"][0]["amount"];
          DateTime? month = DateTime.now();
          for (var i = 0; i < son[0].history!.length; i++) {
            vaqtincha = son[0].history![i].amount!;
            month.month == son[0].history![i].createdAt!.month
                ? amount = (amount + vaqtincha)
                : null;
            debugPrint("Amount: $amount");
          }
          debugPrint("Amountning oxirgi korinishi $amount");
          GetStorage().write("amount", amount);
          debugPrint("""
cars lenth: ${GetStorage().read("cards")}
lenth: $cards
nmadur: $yanason
res.body: ${res.body}
data: $data
qrcode:$qrcodeeee
history: $history
totalBallance: $totalBalance
qrcode: ${GetStorage().read("qrcode")}
""");
        } else {
          debugPrint("cards lenth: $cards");
          debugPrint("res.body: ${res.body}");
          debugPrint("second history: $secondhistory");

          debugPrint("getstorage da amount 0 ekan");
          GetStorage().write("amount", 0.0);
        }
        if (son.length == 2) {
          GetStorage().write("pythicalCardEncrypted", son[1].cardEncrypted!);
          debugPrint("phythical card: ${son[1].cardEncrypted}");
        }
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
