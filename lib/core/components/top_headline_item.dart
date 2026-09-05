import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/components/custom_main_image.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/styles/text_styles.dart';

class TopHeadlineItem extends StatelessWidget {
  const TopHeadlineItem({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomMainImage(
          image: article.image,
          height: AppSizes.height206,
          width: double.infinity,
        ),
        Gap(AppSizes.height16),
        Text(
          article.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.title.copyWith(fontSize: AppSizes.fontSize18),
        ),
        Gap(AppSizes.height8),
        Text(
          '${article.author} · ${article.publishedAt}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.subtitle,
        ),
        Gap(AppSizes.height16),
      ],
    );
  }
}
