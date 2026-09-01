import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/constants/app_icons.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/styles/text_styles.dart';
import 'package:news_app/features/home/widgets/categories_list_view.dart';
import 'package:news_app/features/home/widgets/news_list_view_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        toolbarHeight: AppSizes.height120,
        title: Text('explore'.tr(), style: AppTextStyles.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              AppIcons.search,
              color: AppColors.primaryTextColor,
              size: AppSizes.fontSize32,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Gap(AppSizes.height16),
          CategoriesListView(
            selectedCategoryId: selectedCategoryId,
            onCategorySelected: (id) {
              setState(() {
                selectedCategoryId = (selectedCategoryId == id) ? null : id;
              });
            },
          ),
          Gap(AppSizes.height24),
          Expanded(
            child: NewsListViewBuilder(
              key: ValueKey(selectedCategoryId),
              category: selectedCategoryId,
            ),
          ),
        ],
      ),
    );
  }
}
