import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/services/home_services.dart';
import 'package:news_app/core/services/news_cache.dart';

class HomeRepository {
  final HomeServices homeServices;
  HomeRepository(this.homeServices);

  Future<List<ArticleModel>> fetchTopHeadlines({String? category}) async {
    final cachedArticles = NewsCache.get(category);
    if (cachedArticles != null) {
      return cachedArticles;
    }

    try {
      final data = await homeServices.getTopHeadlines(category: category);
      List articlesList = data['articles'] ?? [];

      final articles = articlesList
          .map((article) => ArticleModel.fromJson(article))
          .toList();

      NewsCache.set(category, articles);
      return articles;
    } catch (e) {
      rethrow;
    }
  }
}