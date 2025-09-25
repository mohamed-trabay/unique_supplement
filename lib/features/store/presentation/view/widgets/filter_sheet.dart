import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/styles.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  bool discounted = false;
  bool inStock = false;
  String sortBy = 'default';
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'فلترة المنتجات',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          _PriceSlider(
            value: _sliderValue,
            onChanged: (val) => setState(() => _sliderValue = val),
          ),
          const SizedBox(height: 20),

          _FilterCheckboxes(
            discounted: discounted,
            inStock: inStock,
            onChangedDiscounted: (val) => setState(() => discounted = val),
            onChangedInStock: (val) => setState(() => inStock = val),
          ),

          const SizedBox(height: 10),

          _SortBySection(
            sortBy: sortBy,
            onChanged: (val) => setState(() => sortBy = val!),
          ),

          const SizedBox(height: 20),

          // ✅ زر التطبيق
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, {
                'discounted': discounted,
                'inStock': inStock,
                'sortBy': sortBy,
                'sliderValue': _sliderValue,
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.yellowPrimary,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'تطبيق',
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.background(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _PriceSlider({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: AppColors.yellowPrimary,
      value: value,
      max: 100,
      divisions: 100,
      label: value.round().toString(),
      onChanged: onChanged,
    );
  }
}

class _FilterCheckboxes extends StatelessWidget {
  final bool discounted;
  final bool inStock;
  final ValueChanged<bool> onChangedDiscounted;
  final ValueChanged<bool> onChangedInStock;

  const _FilterCheckboxes({
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

class _SortBySection extends StatelessWidget {
  final String sortBy;
  final ValueChanged<String?> onChanged;

  const _SortBySection({required this.sortBy, required this.onChanged});

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
          value: 'topRated',
          groupValue: sortBy,
          onChanged: onChanged,
          title: const Text('الأعلى تقييمًا'),
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
