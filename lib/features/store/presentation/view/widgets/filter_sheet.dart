import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/styles.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  bool onSale = false;
  bool inStock = false;
  String sortBy = 'date';
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('فلترة المنتجات', style: Styles.textStyle18),
          SizedBox(height: 20.h),

          _PriceSlider(
            value: _sliderValue,
            onChanged: (val) => setState(() => _sliderValue = val),
          ),
          SizedBox(height: 20.h),

          _FilterCheckboxes(
            discounted: onSale,
            inStock: inStock,
            onChangedDiscounted: (val) => setState(() => onSale = val),
            onChangedInStock: (val) => setState(() => inStock = val),
          ),

          SizedBox(height: 10.h),

          _SortBySection(
            sortBy: sortBy,
            onChanged: (val) => setState(() => sortBy = val!),
          ),

          SizedBox(height: 20.h),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, {
                'discounted': onSale,
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
