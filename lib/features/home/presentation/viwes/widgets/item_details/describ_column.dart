import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';

class DescribColumn extends StatefulWidget {
  const DescribColumn({super.key, required this.products});
  final ProductModel products;

  @override
  State<DescribColumn> createState() => _DescribColumnState();
}

class _DescribColumnState extends State<DescribColumn> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final description = widget.products.description;

    if (description.trim().isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.description,
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.h),
          Text(
            'لا يوجد وصف',
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.description,
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.h),

        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,

          firstChild: SizedBox(
            height: 70.h,
            child: Html(
              data: description,
              style: {
                'body': Style(
                  fontSize: FontSize(16),
                  fontWeight: FontWeight.w400,
                  margin: Margins.zero,
                ),
              },
            ),
          ),

          secondChild: Html(
            data: description,
            style: {
              'body': Style(
                fontSize: FontSize(16),
                fontWeight: FontWeight.w400,
                margin: Margins.zero,
              ),
            },
          ),
        ),

        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              isExpanded ? 'قراءة أقل' : 'قراءة المزيد',
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
