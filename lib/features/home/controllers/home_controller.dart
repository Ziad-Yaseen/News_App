import 'package:flutter/material.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/repositories/home_repository.dart';

class HomeController extends ChangeNotifier {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository) {
    fetchArticles();
  }

  String? _selectedCategoryId;
  String? get selectedCategoryId => _selectedCategoryId;

  List<ArticleModel>? _articles;
  List<ArticleModel>? get articles => _articles;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void selectCategory(String id) {
    _selectedCategoryId = (_selectedCategoryId == id) ? null : id;
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _articles = await _homeRepository.fetchTopHeadlines(
        category: _selectedCategoryId,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
