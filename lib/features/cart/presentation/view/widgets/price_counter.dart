import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/custom_counter.dart';

class PriceCounter extends StatefulWidget {
  const PriceCounter({super.key, required this.basePrice});

  final int basePrice;

  @override
  State<PriceCounter> createState() => _PriceCounterState();
}

class _PriceCounterState extends State<PriceCounter> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.basePrice * quantity;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCounter(
          onChanged: (val) {
            setState(() {
              quantity = val;
            });
          },
        ),
        Text(
          '${totalPrice.toStringAsFixed(2)} ر.س',
          style: Styles.textStyle14Bold,
        ),
      ],
    );
  }
}
