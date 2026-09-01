import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/components/custom_main_image.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/styles/text_styles.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.p32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.title.copyWith(
                    fontSize: AppSizes.fontSize18,
                  ),
                ),
                Gap(AppSizes.height4),
                Text(
                  '${article.author} · ${article.publishedAt}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.subtitle,
                ),
              ],
            ),
          ),
          Gap(AppSizes.width16),

          CustomMainImage(
            image: article.image,
            height: AppSizes.height80,
            width: AppSizes.width112,
          ),
        ],
      ),
    );
  }
}
