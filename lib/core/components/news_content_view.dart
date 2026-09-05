import 'package:flutter/material.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/components/loading_widget.dart';
import 'package:news_app/core/components/news_list_view.dart';
import 'package:news_app/core/components/my_error_widget.dart';

class NewsContentView extends StatelessWidget {
  const NewsContentView({
    super.key,
    required this.isLoading,
    this.errorMessage,
    this.articles,
    required this.onRetry,
    required this.isSearch
  });

  final bool isLoading;
  final String? errorMessage;
  final List<ArticleModel>? articles;
  final VoidCallback onRetry;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    Widget sliverContent;

    if (isLoading) {
      sliverContent = const LoadingWidget();
    } else if (errorMessage != null) {
      final msg = errorMessage!.toLowerCase();
      final isNetworkError = msg.contains('socket') || msg.contains('network');
      sliverContent = MyErrorWidget(
        isNetworkError: isNetworkError,
        fetchNews: onRetry,
      );
    } else if (articles != null && articles!.isNotEmpty) {
      sliverContent = NewsListView(articles: articles!, isSearch: isSearch,);
    } else {
      sliverContent = const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [sliverContent],
    );
  }
}