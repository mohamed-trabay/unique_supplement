import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/features/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';

class ActionButton extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  final EdgeInsets? padding;
  final double? height;

  const ActionButton({
    super.key,
    required this.product,
    required this.quantity,
    this.padding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        bool inCart = false;
        if (state is CartLoaded) {
          inCart = state.contains(product);
        }

        return ElevatedButton(
          onPressed: () {
            context.read<CartCubit>().toggleCart(product, quantity: quantity);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                inCart ? AppColors.greyprimmary : AppColors.yellowPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            minimumSize: Size(0, height ?? 40.h),
            padding: padding ?? EdgeInsets.symmetric(horizontal: 24.w),
          ),
          child: Text(
            inCart ? 'احذف من السله' : 'أضف إلى السله',
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.background(context),
            ),
          ),
        );
      },
    );
  }
}
