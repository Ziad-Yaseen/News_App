import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/constants/app_sizes.dart';

class CustomMainImage extends StatelessWidget {
  const CustomMainImage({
    super.key,
    required this.image,
    required this.height,
    required this.width,
  });

  final String image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.radius12),
      child: CachedNetworkImage(
        imageUrl: image,
        width: width,
        height: height,
        fit: BoxFit.cover,

        placeholder: (context, url) => Container(
          color: Colors.grey[100],
          child: const Center(child: CircularProgressIndicator(
            color: AppColors.greyText,
          )),
        ),

        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: AppColors.fill,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Icon(
                Icons.image_not_supported_outlined,
                size: height < 100 ? 30 : AppSizes.fontSize60,
                color: AppColors.greyFill,
              ),
              if (height >= 100) ...[
                Gap(AppSizes.height12),
                const Text(
                  "No Image",
                  style: TextStyle(fontSize: 16, color: AppColors.greyText),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
