import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/action_button.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    super.key,
    required this.products,
    required this.quantity,
    required this.product,
  });

  final ProductModel product;
  final ProductModel products;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${int.parse(products.price) * quantity} ر.س',
          style: Styles.textStyle22,
        ),
        ActionButton(product: product, quantity: quantity),
      ],
    );
  }
}
