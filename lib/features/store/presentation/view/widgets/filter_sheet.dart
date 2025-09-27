import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'filter_checkboxes.dart';
import 'sort_by_section.dart';

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

          FilterCheckboxes(
            discounted: onSale,
            inStock: inStock,
            onChangedDiscounted: (val) => setState(() => onSale = val),
            onChangedInStock: (val) => setState(() => inStock = val),
          ),
          SizedBox(height: 10.h),

          SortBySection(
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
