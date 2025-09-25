import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/widgets/action_button.dart';
import 'package:unique_supplement/features/cart/presentation/view/widgets/order_row.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      padding: const EdgeInsets.all(16),
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
          const OrderRow(title: 'سعر المنتجات', price: '300ر.س'),
          SizedBox(height: 11.h),
          const OrderRow(title: 'الخصم', price: '5.س'),

          Divider(height: 30.h, thickness: 1),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المجموع:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '295 ر.س',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 25.h),
          ActionButton(title: 'اتمام الطلب', onPressed: () {}),
        ],
      ),
    );
  }
}
