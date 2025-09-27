import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/custom_loading_indicator.dart';
import 'package:unique_supplement/features/home/data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99.h,
      width: 77.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCategoryImage(
            imageUrl:
                categoryModel.image?.src ??
                'https://testapp.zbooma.com/wp-content/uploads/2025/08/Group-1000007728.png',
          ),
          SizedBox(height: 4.h),
          Text(
            categoryModel.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Styles.textStyle12,
          ),
        ],
      ),
    );
  }
}

class CustomCategoryImage extends StatelessWidget {
  final String imageUrl;
  const CustomCategoryImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: 38.r,
          backgroundColor: AppColors.yellowPrimary,
          backgroundImage: imageProvider,
        );
      },
      placeholder:
          (context, url) =>
              const CustomLoadingIndicator(isCircle: true, aspectRatio: 1),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
