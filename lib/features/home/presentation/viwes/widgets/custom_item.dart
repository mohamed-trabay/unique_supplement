import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/app_router.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/utiles/assets.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_buttom.dart';
import 'package:unique_supplement/core/widgets/fav_icon.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_item_image.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kItemDetailsView);
      },
      child: Stack(
        children: [
          Container(
            height: height * 0.35,
            decoration: BoxDecoration(
              color: AppColors.background(context),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor(context),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(10.r),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.16,
                  child: const CustomItemImage(imageURL: AssetsData.item),
                ),
                Text(
                  'واي اف اكس كاربولين نكهة بارتقال ١.٩٥ كغ',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14Bold,
                ),
                SizedBox(height: 2.h),
                Text(
                  'كاربوهيدرات',
                  style: Styles.textStyle12.copyWith(
                    color: AppColors.greyprimmary,
                  ),
                ),
                SizedBox(height: 7.h),
                Text('28,00ر.س', style: Styles.textStyle14Bold),
                CustomButton(title: AppStrings.addtoCart, onPressed: () {}),
              ],
            ),
          ),
          const Positioned(top: 8, left: 2, child: FavIcon()),
        ],
      ),
    );
  }
}
