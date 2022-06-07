import 'package:asia_uz/core/model/get/news_view_models.dart';
import 'package:flutter/material.dart';

abstract class NewsViewState {
  const NewsViewState();
}

class NewsViewInitial extends NewsViewState {
  const NewsViewInitial();
}

class NewsViewLoading extends NewsViewState {
  const NewsViewLoading();
}

class NewsViewCompleted extends NewsViewState {
  final NewsViewModels response;
  const NewsViewCompleted(this.response);
}

class NewsViewError extends NewsViewState{
  final String errorMsg;
  const NewsViewError(this.errorMsg);
}
