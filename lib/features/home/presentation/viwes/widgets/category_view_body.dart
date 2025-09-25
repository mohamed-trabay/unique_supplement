import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/widgets/custom_app_bar.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/category_grid.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(20.0.r),
            child: Column(
              children: [
                const CustomAppBar(title: AppStrings.categories),
                SizedBox(height: 12.h),
                const CategoryGrid(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
