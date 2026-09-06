import 'package:flutter/material.dart';
import 'package:news_app/core/components/custom_main_image.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/features/article_view/widgets/article_view_details.dart';

class ArticleWidgetView extends StatelessWidget {
  const ArticleWidgetView({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CustomMainImage(
          image: article.image,
          height: AppSizes.height316,
          width: double.infinity,
          radius: 0,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: AppSizes.height271,
          child: ArticleViewDetails(article: article),
        ),
      ],
    );
  }
}
