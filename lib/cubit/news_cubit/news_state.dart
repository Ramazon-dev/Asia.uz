import 'package:asia_uz/core/model/get/news_model.dart';
import 'package:flutter/material.dart';

import '../../core/imports/imports.dart';

abstract class NewsState{
  const NewsState();
}

class NewsInitial extends NewsState{
  const NewsInitial();
}

class NewsLoading extends NewsState{
  const NewsLoading();
}

class NewsCompleted extends NewsState{
  final List<NewsModels> response;
  const NewsCompleted(this.response);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NewsCompleted && listEquals(o.response, response);
  }

  @override
  int get hashCode => response.hashCode;

}

class NewsError extends NewsState{
  final String errorMessange;
  const NewsError(this.errorMessange);
}