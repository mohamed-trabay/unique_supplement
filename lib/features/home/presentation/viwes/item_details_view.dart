import 'package:flutter/material.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/item_details_view_body.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key, required this.productmodel});
  final ProductModel productmodel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: ItemDetailsViewBody(productmodel: productmodel)),
    );
  }
}
