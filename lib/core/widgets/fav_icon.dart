import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      decoration: BoxDecoration(
        color: AppColors.background(context),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border_outlined),
        ),
      ),
    );
  }
}
