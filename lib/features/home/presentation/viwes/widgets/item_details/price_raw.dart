import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/action_button.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({super.key, required this.products});
  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${products.price} ر.س', style: Styles.textStyle22),

        ActionButton(title: AppStrings.addtoCart, onPressed: () {}),
      ],
    );
  }
}
