import 'dart:convert';

import 'package:asia_uz/core/model/shops_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<ShopsModel> getShops() async {
  debugPrint("funksiya ichiga kirdi ");

  final res = await http.get(
    Uri.parse(
      'https://asia-uz.herokuapp.com/shops',
    ),
  );
  debugPrint("resdan otdi ${res.body}");

  if (res.statusCode == 200 || res.statusCode == 201) {
    debugPrint("if ga kirdi ${res.body}");
    return ShopsModel.fromJson(jsonDecode(res.body));
  } else {
    debugPrint("else ga otb ketti");
    throw Exception("Xato ketti buyogi");
  }
}
