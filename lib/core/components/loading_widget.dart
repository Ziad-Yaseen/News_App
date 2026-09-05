import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.blue,
              strokeWidth: 4.0,
            ),
            const SizedBox(height: 20),
            Text(
              'loading'.tr(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
