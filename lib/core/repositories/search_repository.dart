import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/services/search_services.dart';

class SearchRepository {
  final SearchServices searchServices;

  SearchRepository(this.searchServices);

  Future<List<ArticleModel>> fetchSearchResult(String search) async {
    try {
      final data = await searchServices.getSearchResults(search);
      List articlesList = data['articles'] ?? [];

      final articles = articlesList
          .map((article) => ArticleModel.fromJson(article))
          .toList();
      return articles;
    } catch (e) {
      rethrow;
    }
  }
}
