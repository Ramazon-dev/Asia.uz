import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/cubit/news_cubit/news_state.dart';
import 'package:asia_uz/cubit/news_view_cubit/news_view_state.dart';
import 'package:asia_uz/service/api/get/new_view_api_services.dart';
import 'package:flutter/material.dart';

class NewsViewCubit extends Cubit<NewsViewState>{
  final NewsViewApiServices newsViewApiServices;
  String id;
  NewsViewCubit(this.newsViewApiServices ,this.id) : super(const NewsViewInitial()){
    getNewsViewData();
  }

  Future<void> getNewsViewData() async{
    try {
      emit(const NewsViewInitial());
      await Future.delayed(const Duration(seconds: 3));
      final response = await newsViewApiServices.getData(id);
      emit(NewsViewCompleted(response));
    } catch (e) {
      emit(NewsViewError(e.toString()));
    }
  }
}