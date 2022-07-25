import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;

class DevicesService {
  static Future devicesService(String fcmToken) async {
    String platform = Platform.operatingSystem;
    debugPrint("fcm keldi: $fcmToken");
    debugPrint("deviceService api iwga tushdi");
    debugPrint(" device service Platform is ${GetStorage().read("platform")}");
    debugPrint("device service token: ${GetStorage().read('token')}");
    var res = await http.post(
      Uri.parse(
        BaseUrl.baseUrl + "/devices",
      ),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
      },
      body: {"token": fcmToken, "platform": platform},
    );
    try {
      debugPrint("device service try ga kirdi");
      debugPrint("device service statuscode");
      if (res.statusCode == 200 || res.statusCode == 201) {
        var data = jsonDecode(res.body);
        debugPrint("device service if ga kirdi va body: $data");
        return data;
      } else {
        debugPrint("deviceService else ga otib ketti");
        throw "error";
      }
    } catch (e) {
      debugPrint("deviceService catch ga otib ketti");

      debugPrint(e.toString());
    }
  }
}
