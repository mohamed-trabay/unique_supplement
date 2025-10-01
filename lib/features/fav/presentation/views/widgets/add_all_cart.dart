import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/features/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:unique_supplement/features/fav/presentation/manger/fav_cubit/fav_cubit.dart';

class AddAllToCartButton extends StatelessWidget {
  const AddAllToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (state is FavoritesSuccess && state.favorites.isNotEmpty) {
          return SizedBox(
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellowPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: () {
                // استدعاء الدالة الجديدة لإضافة كل المنتجات للكارت
                context.read<CartCubit>().addMultipleToCart(state.favorites);

                // رسالة تأكيد
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم إضافة جميع المنتجات للكارت'),
                  ),
                );
              },
              child: Text(
                'Add All to Cart',
                style: Styles.textStyle22.copyWith(color: Colors.white),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
