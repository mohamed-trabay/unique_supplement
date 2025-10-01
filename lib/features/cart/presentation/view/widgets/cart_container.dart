import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/app_router.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/fav_icon.dart';
import 'package:unique_supplement/features/cart/data/models/cart_model.dart';
import 'package:unique_supplement/features/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:unique_supplement/features/cart/presentation/view/widgets/price_counter.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_item_image.dart';

class CartContainer extends StatelessWidget {
  final CartItemModel cartitem;
  const CartContainer({super.key, required this.cartitem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kItemDetailsView, extra: cartitem.product);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.0.r),
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
                  SizedBox(
                    height: 120.h,
                    child: CustomItemImage(
                      imageURL: cartitem.product.images[0].src,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cartitem.product.name,
                          style: Styles.textStyle14Bold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          cartitem.product.categories[0].name,
                          style: Styles.textStyle14.copyWith(
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.h),
                        PriceCounter(cartItem: cartitem),
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
                  onPressed: () {
                    context.read<CartCubit>().removeFromCart(
                      cartitem.product.id,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              right: -14,
              top: -8,
              child: FavIcon(product: cartitem.product),
            ),
          ],
        ),
      ),
    );
  }
}
