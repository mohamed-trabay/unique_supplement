import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';

class FilterCheckboxes extends StatelessWidget {
  final bool discounted;
  final bool inStock;
  final ValueChanged<bool> onChangedDiscounted;
  final ValueChanged<bool> onChangedInStock;

  const FilterCheckboxes({
    super.key,
    required this.discounted,
    required this.inStock,
    required this.onChangedDiscounted,
    required this.onChangedInStock,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          activeColor: AppColors.yellowPrimary,
          value: discounted,
          onChanged: (val) => onChangedDiscounted(val!),
          title: const Text('المنتجات المخفضة فقط'),
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        CheckboxListTile(
          activeColor: AppColors.yellowPrimary,
          value: inStock,
          onChanged: (val) => onChangedInStock(val!),
          title: const Text('المتوفر في المخزون فقط'),
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ],
    );
  }
}
