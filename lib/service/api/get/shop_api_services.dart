import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:asia_uz/core/model/get/shop_api_model.dart';

abstract class ShopRepository {
  Future<List<ShopsApiModel>> getDateFromApi();
}

class SampleShopRepository implements ShopRepository {
  final baseUrl = Uri.parse('https://asia-uz.herokuapp.com/shops');

  @override
  Future<List<ShopsApiModel>> getDateFromApi() async {
    final response = await http.get(baseUrl);
    return (jsonDecode(response.body) as List).map((e) => ShopsApiModel.fromJson(e)).toList();
  }
}
