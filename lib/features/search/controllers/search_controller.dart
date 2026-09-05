import 'package:flutter/material.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/repositories/search_repository.dart';

class MySearchController extends ChangeNotifier {
  final SearchRepository _searchRepository;

  MySearchController(this._searchRepository);

  List<ArticleModel>? _articles;
  List<ArticleModel>? get articles => _articles;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String _currentQuery = '';

  Future<void> searchArticles(String query) async {
    if (query.trim().isEmpty) return;

    _currentQuery = query;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _articles = await _searchRepository.fetchSearchResult(query);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void retrySearch() {
    if (_currentQuery.isNotEmpty) {
      searchArticles(_currentQuery);
    }
  }
}
