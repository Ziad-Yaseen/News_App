import 'package:flutter/material.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/repositories/home_repository.dart';
import 'package:news_app/core/services/home_services.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, this.category = 'general'});

  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<ArticleModel>> _newsFuture;

  @override
  void initState() {
    _newsFuture = HomeRepository(HomeServices()).fetchTopHeadlines();
    super.initState();
  }

  void _fetchNews() {
    setState(() {
      _newsFuture = NewsService().getTopHeadlines(category: widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _newsFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          final errorMessage = snapshot.error.toString().toLowerCase();
          final isNetworkError =
              errorMessage.contains('socket') ||
              errorMessage.contains('network');
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Icon(
                    isNetworkError ? Icons.wifi_off : Icons.error_outline,
                    size: 50,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isNetworkError
                        ? 'No Internet Connection\nPlease check your network'
                        : 'OOPS...\nThere was an error, try again later',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: _fetchNews,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Try Again'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 4.0,
                  ),

                  const SizedBox(height: 20),
                  Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
