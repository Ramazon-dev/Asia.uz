import 'dart:convert';
import 'package:asia_uz/core/constants/base/base_url.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:http/http.dart' as http;
import 'package:asia_uz/core/model/get/shop_api_model.dart';

abstract class ShopRepository {
  Future<List<ShopsModel>> getDateFromApi();
}

class SampleShopRepository implements ShopRepository {
  final baseUrl = Uri.parse(BaseUrl.baseUrl + '/shops');

  @override
  Future<List<ShopsModel>> getDateFromApi() async {
    debugPrint("shop apiga kirdi");
    final response = await http.get(
      baseUrl,
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
      },
    );
    debugPrint("shop response dan otdi");
    var data = (json.decode(response.body) as List)
        .map((e) => ShopsModel.fromJson(e))
        .toList();
    debugPrint("response ${data[0].address}");
    return data;
  }
}
