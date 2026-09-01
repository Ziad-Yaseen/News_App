import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/constants/app_sizes.dart';

class AppTextStyles {
  static TextStyle title = GoogleFonts.inter(
    fontSize: AppSizes.fontSize32,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryTextColor,
  );

  static TextStyle subtitle = GoogleFonts.inter(
    fontSize: AppSizes.fontSize12,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryTextColor,
  );
}
