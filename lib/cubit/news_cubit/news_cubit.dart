import 'package:asia_uz/cubit/news_cubit/news_state.dart';
import 'package:asia_uz/service/api/get/news_api_services.dart';
import 'package:flutter/material.dart';

import '../../core/imports/imports.dart';

class NewsCubut extends Cubit<NewsState>{
  final NewsApiServicesRepository newsApiServicesRepository;
  NewsCubut(this.newsApiServicesRepository) : super(const NewsInitial()){
    getDate();
  }

  Future<void> getDate() async {
    try {
      emit(const NewsLoading());
      await Future.delayed(const Duration(seconds: 3));
      final response = await newsApiServicesRepository.getNews();
      emit(NewsCompleted(response));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}