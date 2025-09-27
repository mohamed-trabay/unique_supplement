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
  String sortBy = 'default';
  RangeValues _priceRange = const RangeValues(50, 250);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('فلترة المنتجات', style: Styles.textStyle18),
          SizedBox(height: 20.h),

          // RangeSlider للسعر
          RangeSlider(
            values: _priceRange,
            min: 0,
            max: 500,
            divisions: 50,
            labels: RangeLabels(
              _priceRange.start.round().toString(),
              _priceRange.end.round().toString(),
            ),
            activeColor: AppColors.yellowPrimary,
            onChanged: (values) => setState(() => _priceRange = values),
          ),
          SizedBox(height: 20.h),

          // خيارات الخصومات والمخزون
          _FilterCheckboxes(
            discounted: onSale,
            inStock: inStock,
            onChangedDiscounted: (val) => setState(() => onSale = val),
            onChangedInStock: (val) => setState(() => inStock = val),
          ),
          SizedBox(height: 10.h),

          // ترتيب حسب
          _SortBySection(
            sortBy: sortBy,
            onChanged: (val) => setState(() => sortBy = val!),
          ),

          SizedBox(height: 20.h),

          // زر تطبيق الفلاتر
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, {
                'discounted': onSale,
                'inStock': inStock,
                'sortBy': sortBy,
                'minPrice': _priceRange.start.toInt(),
                'maxPrice': _priceRange.end.toInt(),
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

// ================== RangeSlider Component ==================
class _PriceSlider extends StatelessWidget {
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;

  const _PriceSlider({required this.values, required this.onChanged});

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

// ================== Checkboxes Component ==================
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

// ================== SortBy Component ==================
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
