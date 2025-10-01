import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/app_router.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_buttom.dart';
import 'package:unique_supplement/core/widgets/fav_icon.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_item_image.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kItemDetailsView, extra: productModel);
      },
      child: Stack(
        children: [
          Container(
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CustomItemImage(
                    imageURL:
                        productModel.images.isNotEmpty
                            ? productModel.images[0].src
                            : 'https://testapp.zbooma.com/wp-content/uploads/2025/09/placeholder.jpg',
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  productModel.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14Bold,
                ),
                SizedBox(height: 2.h),
                Text(
                  productModel.categories.isNotEmpty
                      ? productModel.categories[0].name
                      : '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle12.copyWith(
                    color: AppColors.greyprimmary,
                  ),
                ),
                SizedBox(height: 7.h),
                Text(
                  '${productModel.price} ر.س',
                  style: Styles.textStyle14Bold,
                ),
                SizedBox(height: 6.h),
                CustomButton(
                  title: AppStrings.moreOption,
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kItemDetailsView, extra: productModel);
                  },
                ),
              ],
            ),
          ),
          Positioned(top: 8, left: 2, child: FavIcon(product: productModel)),
        ],
      ),
    );
  }
}
