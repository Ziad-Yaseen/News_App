import 'package:flutter/material.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/repositories/home_repository.dart';
import 'package:news_app/core/services/home_services.dart';
import 'package:news_app/features/home/widgets/loading_widget.dart';
import 'package:news_app/features/home/widgets/news_list_view.dart';
import 'package:news_app/features/home/widgets/my_error_widget.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, this.category});

  final String? category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<ArticleModel>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _newsFuture = HomeRepository(HomeServices())
        .fetchTopHeadlines(category: widget.category);
  }

  void _fetchNews() {
    setState(() {
      _loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: _newsFuture,
      builder: (context, snapshot) {
        Widget sliverContent;

        if (snapshot.hasData) {
          sliverContent = NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          final errorMessage = snapshot.error.toString().toLowerCase();
          final isNetworkError =
              errorMessage.contains('socket') ||
              errorMessage.contains('network');
          sliverContent = MyErrorWidget(
            isNetworkError: isNetworkError,
            fetchNews: _fetchNews,
          );
        } else {
          sliverContent = const LoadingWidget();
        }
        return CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [sliverContent],
        );
      },
    );
  }
}
