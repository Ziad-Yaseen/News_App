import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/constants/app_icons.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        scrollPhysics: const BouncingScrollPhysics(),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        autofocus: false,
        cursorColor: AppColors.blue,
        decoration: InputDecoration(
          prefixIcon: Icon(
            AppIcons.search,
            size: AppSizes.fontSize20,
            color: AppColors.grey,
          ),
          suffixIcon: Icon(
            AppIcons.cancel,
            size: AppSizes.fontSize20,
            color: AppColors.lightgreyText,
          ),
          iconColor: AppColors.grey,
          hintText: 'Search',
          hintStyle: AppTextStyles.cancel.copyWith(
            color: AppColors.grey,
            fontSize: AppSizes.fontSize17,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(AppSizes.radius8),
          ),
          filled: true,
          fillColor: AppColors.lightGreyFill,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.blue),
            borderRadius: BorderRadius.circular(AppSizes.radius8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red.withValues(alpha: 0.6)),
            borderRadius: BorderRadius.circular(AppSizes.radius8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(AppSizes.radius8),
          ),
        ),
        style: AppTextStyles.cancel.copyWith(
          color: AppColors.black,
          fontSize: AppSizes.fontSize17,
        ),
      ),
    );
  }
}
