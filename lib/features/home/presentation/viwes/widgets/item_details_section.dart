import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/custom_counter.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/item_details/describ_column.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/item_details/price_raw.dart';

class ItemDetailsSection extends StatefulWidget {
  const ItemDetailsSection({super.key, required this.products});
  final ProductModel products;

  @override
  State<ItemDetailsSection> createState() => _ItemDetailsSectionState();
}

class _ItemDetailsSectionState extends State<ItemDetailsSection> {
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
        // SizedBox(height: 6.h),
        // const BookRating(rating: 0),
        SizedBox(height: 20.h),
        DescribColumn(products: widget.products),
        SizedBox(height: 16.h),

        CustomCounter(
          initialValue: quantity,
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
