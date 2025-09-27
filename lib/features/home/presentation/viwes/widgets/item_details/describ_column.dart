import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';

class DescribColumn extends StatelessWidget {
  const DescribColumn({super.key, required this.products});
  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.description,
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.h),
        Html(
          data: products.description,
          style: {
            'body': Style(
              fontSize: FontSize(16),
              fontWeight: FontWeight.w400,
              margin: Margins.zero,
            ),
          },
        ),
      ],
    );
  }
}
