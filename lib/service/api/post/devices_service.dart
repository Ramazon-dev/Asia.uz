import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;

class DevicesService {
  static Future devicesService() async {
    debugPrint("Platform is ${GetStorage().read("platform")}");
    var res = await http.post(
      Uri.parse(
        BaseUrl.baseUrl + "/devices",
      ),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
      },
      body: {
        "token":
            "eIopELx6SMSQBg48RnutsM:APA91bG1NtHVrR8u7noCyiaX3OBbE_mOXenQ91TvbMIn0xC2PVVY8NHldavlPIl_QH4ZwELG33dg91pgu_0RvYIiQoA0TXe7RO3eymSeAdPbg1DSG6Xzp-eFL15sOfJ4hHOt9aPB_ZoT",
        "platform": GetStorage().read("platform")
      },
    );
    try {
      if (res.statusCode == 200 || res.statusCode == 201) {
        var data = jsonDecode(res.body);
        return data;
      } else {
        throw "error";
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
