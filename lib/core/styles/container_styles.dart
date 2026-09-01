import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/constants/app_sizes.dart';

class ContainerStyles {
  static BoxDecoration isNotSelected = BoxDecoration(
    borderRadius: BorderRadius.circular(AppSizes.radius58),
    border: Border.all(color: AppColors.lightBlue, width: 1),
  );

  static BoxDecoration isSelected = BoxDecoration(
    borderRadius: BorderRadius.circular(AppSizes.radius58),
    color: AppColors.lightBlue,
  );
}
