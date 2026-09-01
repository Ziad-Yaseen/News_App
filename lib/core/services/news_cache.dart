import 'package:news_app/core/models/article_model.dart';

class NewsCache {
  static final Map<String, List<ArticleModel>> _cache = {};

  static String _keyOf(String? category) => category ?? 'no_category';

  static List<ArticleModel>? get(String? category) {
    return _cache[_keyOf(category)];
  }

  static void set(String? category, List<ArticleModel> articles) {
    _cache[_keyOf(category)] = articles;
  }
}