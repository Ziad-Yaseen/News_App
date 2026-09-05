import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    super.key,
    required this.isNetworkError,
    required this.fetchNews,
  });

  final bool isNetworkError;
  final VoidCallback fetchNews;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isNetworkError ? Icons.wifi_off : Icons.error_outline,
              size: 50,
              color: Colors.redAccent,
            ),
            const SizedBox(height: 16),
            Text(
              isNetworkError ? 'no_internet'.tr() : 'oops_error'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: fetchNews,
              icon: const Icon(Icons.refresh),
              label: Text('try_again'.tr()),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
