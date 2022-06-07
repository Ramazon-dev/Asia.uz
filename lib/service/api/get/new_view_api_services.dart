import 'package:asia_uz/core/constants/base/base_url.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/model/get/news_view_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class NewsViewApiServices {
  Future<NewsViewModels> getData(String id);
}

class SampleNewsRepository implements NewsViewApiServices {
  @override
  Future<NewsViewModels> getData(String id) async {
    var response = await http.get(Uri.parse(BaseUrl.baseUrl + "/news/$id"));
    var data = jsonDecode(response.body);
    NewsViewModels newsViewModels = NewsViewModels.fromJson(data);
    return newsViewModels;
  }
}
