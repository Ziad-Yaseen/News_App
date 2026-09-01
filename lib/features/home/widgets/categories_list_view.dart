import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/features/home/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(name: 'Business', id: 'business'),
      CategoryModel(name: 'Entertainment', id: 'entertainment'),
      CategoryModel(name: 'General', id: 'general'),
      CategoryModel(name: 'Health', id: 'health'),
      CategoryModel(name: 'Science', id: 'science'),
      CategoryModel(name: 'Sports', id: 'sports'),
      CategoryModel(name: 'Technology', id: 'technology'),
    ];
    return SizedBox(
      height: AppSizes.height32,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
        separatorBuilder: (context, index) => Gap(AppSizes.width12),
      ),
    );
  }
}
