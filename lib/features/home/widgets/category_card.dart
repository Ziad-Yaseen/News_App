import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/core/styles/container_styles.dart';
import 'package:news_app/core/styles/text_styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSizes.radius58),
      overlayColor: WidgetStatePropertyAll(
        AppColors.lightBlue.withValues(alpha: 0.6),
      ),
      onTap: () {},
      // onTap: () => context.pushNamed(
      //   RouteNames.category,
      // extra: {
      //   'category': category.categoryID,
      //   'title': category.categoryName,
      // },
      // ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.p24),
        height: AppSizes.height32,
        alignment: Alignment.center,
        decoration: ContainerStyles.isNotSelected,
        child: Text(
          category.name,
          style: AppTextStyles.title.copyWith(fontSize: AppSizes.fontSize14),
        ),
      ),
    );
  }
}
