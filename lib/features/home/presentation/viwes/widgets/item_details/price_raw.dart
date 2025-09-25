import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/action_button.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('299.00ر.س', style: Styles.textStyle22),

        ActionButton(title: AppStrings.addtoCart, onPressed: () {}),
      ],
    );
  }
}
