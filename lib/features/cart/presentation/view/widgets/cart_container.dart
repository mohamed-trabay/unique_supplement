import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/assets.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/fav_icon.dart';
import 'package:unique_supplement/features/cart/presentation/view/widgets/price_counter.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        children: [
          Container(
            height: 140.h,
            width: double.infinity,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColors.background(context),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor(context),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(AssetsData.logo, height: 120.h, fit: BoxFit.fill),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1.8 kgنايترو تيك واي بروتين فانيلا كريم',
                        style: Styles.textStyle14Bold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'الوزن :1 رطل',
                        style: Styles.textStyle14.copyWith(color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10.h),
                      const PriceCounter(basePrice: 22),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: -14,
            top: -14,
            child: Container(
              height: 28.h,
              decoration: BoxDecoration(
                color: AppColors.background(context),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: () {},
              ),
            ),
          ),

          const Positioned(right: -8, top: -2, child: FavIcon()),
        ],
      ),
    );
  }
}
