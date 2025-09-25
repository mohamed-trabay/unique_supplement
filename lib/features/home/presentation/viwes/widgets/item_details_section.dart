import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/custom_counter.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/item_details/book_rating.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/item_details/describ_column.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/item_details/price_raw.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});
  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;

    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1.8 kgنايترو تيك واي بروتين فانيلا كريم',
          style: Styles.textStyle24,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 6.h),

        const BookRating(rating: 4),
        SizedBox(height: 20.h),
        const CustomCounter(),
        const DescribColumn(),
        SizedBox(height: 16.h),
        const PriceRow(),
      ],
    );
  }
}
