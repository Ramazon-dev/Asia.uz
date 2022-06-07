import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/model/get/news_model.dart';
import 'package:http/http.dart' as http;

abstract class NewsApiServicesRepository{
  Future<List<NewsModels>> getNews();
}

class SimpleNewsServices implements NewsApiServicesRepository{
  final baseUrl = Uri.parse(BaseUrl.baseUrl + "/news");

  @override
  Future<List<NewsModels>> getNews() async{
    var response = await http.get(baseUrl);
    return (json.decode(response.body) as List).map((e) => NewsModels.fromJson(e)).toList();
  }
}