import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/styles/text_styles.dart';
import 'package:news_app/features/search/widgets/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              const CustomTextField(),

              Gap(AppSizes.width12),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Text('cancel'.tr(), style: AppTextStyles.cancel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
