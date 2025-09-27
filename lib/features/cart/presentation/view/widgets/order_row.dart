import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/styles.dart';

class OrderRow extends StatelessWidget {
  const OrderRow({super.key, required this.title, required this.price});
  final String price;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.textStyle16),
        Text(price, style: Styles.textStyle18),
      ],
    );
  }
}
