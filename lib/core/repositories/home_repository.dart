import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/services/home_services.dart';

class HomeRepository {
  final HomeServices homeServices;
  HomeRepository(this.homeServices);

  Future<List<ArticleModel>> fetchTopHeadlines({String? category}) async {
    try {
      final data = await homeServices.getTopHeadlines(category: category);
      List articlesList = data['articles'] ?? [];
      
      return articlesList
          .map((article) => ArticleModel.fromJson(article))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}