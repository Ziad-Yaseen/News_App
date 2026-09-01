import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/features/home/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key, 
    this.selectedCategoryId, 
    required this.onCategorySelected,
  });

  final String? selectedCategoryId;
  final Function(String) onCategorySelected;

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
          final category = categories[index];
          return CategoryCard(
            category: category,
            isSelected: category.id == selectedCategoryId,
            onTap: () => onCategorySelected(category.id),
          );
        },
        separatorBuilder: (context, index) => Gap(AppSizes.width12),
      ),
    );
  }
}