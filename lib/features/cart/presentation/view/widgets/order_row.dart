import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/styles.dart';

class OrderRow extends StatelessWidget {
  final String title;
  final String price;

  const OrderRow({super.key, required this.title, required this.price});

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
