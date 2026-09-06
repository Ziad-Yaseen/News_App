import 'package:flutter/material.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/features/article_view/widgets/article_widget_view.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(child: ArticleWidgetView(article: article)),
    );
  }
}
