import 'package:asia_uz/core/widgets/is_loading.dart';
import 'package:http/http.dart' as http;
import 'package:asia_uz/core/imports/imports.dart';

class VerifyNumberService {
  
  static Future verifyNumberService(String phoneNumber) async {
    IsLoadingWidget(isload: false);
    debugPrint('telefon raqam : ${GetStorage().read('telNumber')}');
    debugPrint("+998${GetStorage().read('telNumber')}");
    var response = await http.post(
      Uri.parse(BaseUrl.baseUrl + '/customers/verify-number'),
      body: {
        "number": GetStorage().read('telNumber'),
      },
    );
    debugPrint("dfdfdfdfdfd : ${response.body}");

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        // bool status = data['status'];
        debugPrint('response : ${response.body}');
        IsLoadingWidget(isload: true);
        return data;
      } else {
        throw 'ERROR';
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  static setLoading() {}
}
