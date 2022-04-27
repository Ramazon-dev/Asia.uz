import 'dart:convert';

import 'package:asia_uz/core/constants/base/base_url.dart';
import 'package:asia_uz/core/model/get/customers_api_model.dart';
import 'package:http/http.dart' as http;

abstract class CustomersRepository {
  Future<List<CustomersApiModel>> getCustomersDate();
}

class SampleCustomersRepository implements CustomersRepository {
  final baseUrl = Uri.parse(BaseUrl.baseUrl + '/customers');

  @override
  Future<List<CustomersApiModel>> getCustomersDate() async {
    final response = await http.get(baseUrl);
    return (json.decode(response.body) as List)
        .map((e) => CustomersApiModel.fromJson(e))
        .toList();
  }
}
