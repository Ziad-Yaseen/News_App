import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/constants/app_icons.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/routes/route_names.dart';
import 'package:news_app/core/styles/text_styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.lightBlue,
      toolbarHeight: AppSizes.height120,
      title: Text('explore'.tr(), style: AppTextStyles.title),
      actions: [
        IconButton(
          onPressed: () {
            context.pushNamed(RouteNames.search);
          },
          icon: Icon(
            AppIcons.search,
            color: AppColors.primaryTextColor,
            size: AppSizes.fontSize32,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.height120);
}
