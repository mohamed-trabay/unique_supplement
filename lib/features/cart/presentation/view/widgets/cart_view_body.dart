import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/widgets/center_title.dart';
import 'package:unique_supplement/features/cart/presentation/view/widgets/cart_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.r),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CenteredTitle(title: AppStrings.cart),
            SizedBox(height: 30.h),
            const CartList(),
          ],
        ),
      ),
    );
  }
}
