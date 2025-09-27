import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_supplement/core/utiles/app_router.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/Banner_slider.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/category_list.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/home_appbar.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_item_list.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_row.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
                const HomeAppbar(),
                SizedBox(height: 12.h),
                const BannerSlider(),
                SizedBox(height: 23.h),
                CustomRow(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kCategoryView);
                  },
                  title: AppStrings.categories,
                ),
                SizedBox(height: 12.h),
                const CategoryList(),
                SizedBox(height: 22.h),
                CustomRow(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kNewestItemsView);
                  },
                  title: AppStrings.newstsItems,
                ),
                SizedBox(height: 12.h),
                const CustomItemList(limit: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
