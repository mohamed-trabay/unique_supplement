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
    final double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kItemDetailsView, extra: productModel);
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
                  child: CustomItemImage(
                    imageURL:
                        productModel.images.isNotEmpty
                            ? productModel.images[0].src
                            : 'https://testapp.zbooma.com/wp-content/uploads/2025/09/Screenshot_%D9%A2%D9%A0%D9%A2%D9%A5%D9%A0%D9%A9%D9%A1%D9%A5_%D9%A1%D9%A8%D9%A5%D9%A9%D9%A2%D9%A9_Google.jpg',
                  ),
                ),
                Text(
                  productModel.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14Bold,
                ),
                SizedBox(height: 2.h),
                Text(
                  productModel.categories[0].name,
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
