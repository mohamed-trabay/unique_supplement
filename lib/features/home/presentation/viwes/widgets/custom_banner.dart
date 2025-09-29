import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_supplement/core/utiles/app_router.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_buttom.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: 180.h,
            fit: BoxFit.cover,
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.banner1,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle18.copyWith(color: Colors.white),
                ),
                SizedBox(height: 5.h),
                Text(
                  AppStrings.banner11,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle14.copyWith(color: Colors.white),
                ),
                SizedBox(height: 5.h),
                CustomButton(
                  title: AppStrings.banner11Button,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kStoreView);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
