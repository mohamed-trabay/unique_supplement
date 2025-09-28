import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/custom_counter.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/item_details/book_rating.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/item_details/describ_column.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/item_details/price_raw.dart';

class BookDetailsSection extends StatefulWidget {
  const BookDetailsSection({super.key, required this.products});
  final ProductModel products;

  @override
  State<BookDetailsSection> createState() => _BookDetailsSectionState();
}

class _BookDetailsSectionState extends State<BookDetailsSection> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.products.name,
          style: Styles.textStyle24,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 6.h),
        const BookRating(rating: 0),
        SizedBox(height: 20.h),
        DescribColumn(products: widget.products),

        SizedBox(height: 16.h),

        CustomCounter(
          onChanged: (val) {
            setState(() {
              quantity = val;
            });
          },
        ),
        SizedBox(height: 20.h),

        PriceRow(products: widget.products, quantity: quantity),
      ],
    );
  }
}
