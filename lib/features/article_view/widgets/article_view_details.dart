import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/styles/text_styles.dart';
import 'package:news_app/features/article_view/widgets/article_action_section.dart';

class ArticleViewDetails extends StatelessWidget {
  const ArticleViewDetails({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.radius58),
          topRight: Radius.circular(AppSizes.radius58),
        ),
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(AppSizes.height24),
                  Text(article.title, style: AppTextStyles.articleTitle),
                  Gap(AppSizes.height16),
                  Text(
                    '${article.author} . ${article.publishedAt}',
                    style: AppTextStyles.articleAuthorAndDate,
                  ),
                  Gap(AppSizes.height24),
                  Text(article.content, style: AppTextStyles.articleContent),
                ],
              ),
            ),
          ),
          ArticleActionSection(url: article.url),
        ],
      ),
    );
  }
}
