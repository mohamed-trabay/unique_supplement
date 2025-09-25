import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/styles.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.title, this.onPressed});

  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellowPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        minimumSize: Size(0, 45.h),
        padding: const EdgeInsets.symmetric(horizontal: 41),
      ),
      child: Text(
        title,

        style: Styles.textStyle16.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.background(context),
        ),
      ),
    );
  }
}
