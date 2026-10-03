import 'package:news_app/core/models/article_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class LoadingTopHeadlinesState extends HomeStates {}

class SuccessHeadLineState extends HomeStates {
  final List<ArticleModel> topHeadlines;

  SuccessHeadLineState(this.topHeadlines);
}

class ErrorTopHeadlineState extends HomeStates {
  final String error;

  ErrorTopHeadlineState(this.error);
}
