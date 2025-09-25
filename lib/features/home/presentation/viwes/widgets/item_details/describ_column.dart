import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/utiles/styles.dart';

class DescribColumn extends StatelessWidget {
  const DescribColumn({super.key});

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
        Text(
          'مكمل غذائي مصمم خصيصًا لبناء العضلات وزيادة القوة، يجمع بين بروتين مصل الحليب عالي الجودة مع الكرياتين لنتائج أسرع في النمو العضلي وتحسين الأداء الرياضي',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
