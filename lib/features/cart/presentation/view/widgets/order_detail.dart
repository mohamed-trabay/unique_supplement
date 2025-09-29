import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/app_router.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/features/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:unique_supplement/features/cart/presentation/view/widgets/order_row.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_buttom.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        double subtotal = 0;
        double discount = 0;

        if (state is CartLoaded) {
          subtotal = state.items.fold(
            0,
            (sum, item) =>
                sum +
                (double.tryParse(item.product.price) ?? 0) * item.quantity,
          );
          discount = 0;
        }

        double total = subtotal - discount;

        return Container(
          height: 220.h,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.background(context),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor(context),
                blurRadius: 6,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OrderRow(
                title: 'سعر المنتجات',
                price: '${subtotal.toStringAsFixed(2)} ر.س',
              ),
              SizedBox(height: 11.h),
              OrderRow(
                title: 'الخصم',
                price: '${discount.toStringAsFixed(2)} ر.س',
              ),
              Divider(height: 30.h, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('المجموع:', style: Styles.textStyle18),
                  Text(
                    '${total.toStringAsFixed(2)} ر.س',
                    style: Styles.textStyle18,
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              CustomButton(
                title: 'اتمام الطلب',
                height: 45.h,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kUserDetailsView);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
