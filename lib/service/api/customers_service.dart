import 'dart:convert';
import 'package:asia_uz/core/model/customers_model.dart';
import 'package:http/http.dart' as http;

Future<CustomersModel> getCustomers() async {
  final res = await http.get(
    Uri.parse(
      'https://asia-uz.herokuapp.com/customers',
    ),
  );
  if (res.statusCode == 200 || res.statusCode == 201) {
    return CustomersModel.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Xatto ketti');
  }
}
