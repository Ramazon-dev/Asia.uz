import 'dart:convert';
import 'package:asia_uz/core/constants/base/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:asia_uz/core/model/get/shop_api_model.dart';

abstract class ShopRepository {
  Future<List<ShopsApiModel>> getDateFromApi();
}

class SampleShopRepository implements ShopRepository {
  final baseUrl = Uri.parse(BaseUrl.baseUrl + '/shops');

  @override
  Future<List<ShopsApiModel>> getDateFromApi() async {
    final response = await http.get(baseUrl);
    return (jsonDecode(response.body) as List).map((e) => ShopsApiModel.fromJson(e)).toList();
  }
}
