import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/styles.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
  });
  final String title;
  void Function()? onPressed;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellowPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
        minimumSize: Size(0, height ?? 24.h),
        padding: const EdgeInsets.symmetric(horizontal: 15),
      ),
      child: Text(
        title,

        style: Styles.textStyle14.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.background(context),
        ),
      ),
    );
  }
}
