import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/components/primary_outlined_button.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleActionSection extends StatelessWidget {
  const ArticleActionSection({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Gap(AppSizes.height24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: PrimaryOutlinedButton(
                onPressed: () => _handleOpenArticle(context),
              ),
            ),
            Gap(AppSizes.height24),
          ],
        ),
      ),
    );
  }

  Future<void> _handleOpenArticle(BuildContext context) async {
    final Uri? parsedUrl = Uri.tryParse(url);

    final bool isValidUrl =
        url != 'no_url_available'.tr() &&
        parsedUrl != null &&
        parsedUrl.hasAbsolutePath;

    if (!isValidUrl) {
      if (context.mounted) {
        _showErrorSnackBar(context, 'invalid_link'.tr());
      }
      return;
    }

    try {
      final bool launched = await launchUrl(
        parsedUrl,
        mode: LaunchMode.inAppWebView,
      );

      if (!launched) {
        final bool launchedExternal = await launchUrl(
          parsedUrl,
          mode: LaunchMode.externalApplication,
        );

        if (!launchedExternal && context.mounted) {
          _showErrorSnackBar(context, 'open_article_error'.tr());
        }
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorSnackBar(context, 'open_article_error'.tr());
      }
    }
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
