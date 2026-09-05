import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/components/news_tile.dart';
import 'package:news_app/core/components/top_headline_item.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.articles,
    required this.isSearch,
  });

  final List<ArticleModel> articles;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.p32,
        vertical: 16,
      ),
      sliver: SliverList.separated(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          if (isSearch) {
            if (index == 0) return NewsTile(article: articles[index]);
          } else {
            if (index == 0) return TopHeadlineItem(article: articles[index]);
          }
          return NewsTile(article: articles[index]);
        },
        separatorBuilder: (context, index) => Gap(AppSizes.height24),
      ),
    );
  }
}
