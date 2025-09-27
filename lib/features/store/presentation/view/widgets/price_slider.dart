import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';

class PriceSlider extends StatelessWidget {
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;

  const PriceSlider({super.key, required this.values, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: values,
      min: 0,
      max: 500,
      divisions: 50,
      labels: RangeLabels(
        values.start.round().toString(),
        values.end.round().toString(),
      ),
      activeColor: AppColors.yellowPrimary,
      onChanged: onChanged,
    );
  }
}
