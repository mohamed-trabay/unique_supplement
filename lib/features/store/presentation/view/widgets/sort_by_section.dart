import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';

class SortBySection extends StatelessWidget {
  final String sortBy;
  final ValueChanged<String?> onChanged;

  const SortBySection({
    super.key,
    required this.sortBy,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'ترتيب حسب:',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        RadioListTile(
          activeColor: AppColors.yellowPrimary,
          value: 'default',
          groupValue: sortBy,
          onChanged: onChanged,
          title: const Text('الافتراضي'),
        ),
        RadioListTile(
          activeColor: AppColors.yellowPrimary,
          value: 'popular',
          groupValue: sortBy,
          onChanged: onChanged,
          title: const Text('الأكثر شيوعًا'),
        ),
        RadioListTile(
          activeColor: AppColors.yellowPrimary,
          value: 'topPriced',
          groupValue: sortBy,
          onChanged: onChanged,
          title: const Text('الأعلى سعرا'),
        ),
        RadioListTile(
          activeColor: AppColors.yellowPrimary,
          value: 'newest',
          groupValue: sortBy,
          onChanged: onChanged,
          title: const Text('الأحدث أولاً'),
        ),
      ],
    );
  }
}
