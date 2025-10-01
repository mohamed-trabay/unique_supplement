import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/action_button.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({super.key, required this.products, required this.quantity});

  final ProductModel products;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount =
        int.parse(products.price) < int.parse(products.regularPrice);

    final int totalPrice = int.parse(products.price) * quantity;
    final int? totalOldPrice =
        hasDiscount ? int.parse(products.regularPrice) * quantity : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        hasDiscount
            ? Row(
              children: [
                Text(
                  '$totalOldPrice ر.س',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 6.h),
                Text('$totalPrice ر.س', style: Styles.textStyle18),
              ],
            )
            : Text('$totalPrice ر.س', style: Styles.textStyle18),

        ActionButton(product: products, quantity: quantity),
      ],
    );
  }
}
