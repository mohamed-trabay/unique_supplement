import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/assets.dart';
import 'package:unique_supplement/core/utiles/styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

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
          Container(
            height: 77.h,
            width: 77.w,
            decoration: const BoxDecoration(
              color: AppColors.yellowPrimary,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AssetsData.catEx),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'قسم البروتينات',
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
