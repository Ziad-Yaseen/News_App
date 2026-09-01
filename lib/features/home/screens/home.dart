import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/constants/app_icons.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/styles/text_styles.dart';
import 'package:news_app/features/home/widgets/categories_list_view.dart';
import 'package:news_app/features/home/widgets/news_tile.dart';
import 'package:news_app/features/home/widgets/top_headline_item.dart';

class Home extends StatelessWidget {
  const new({super.key});

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
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Gap(AppSizes.height16),
            const CategoriesListView(),
            Gap(AppSizes.height24),
            Expanded(child: ListView()),
          ],
        ),
      ),
    );
  }
}
