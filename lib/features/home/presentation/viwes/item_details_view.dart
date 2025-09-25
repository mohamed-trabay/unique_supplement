import 'package:flutter/material.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/item_details_view_body.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: ItemDetailsViewBody()));
  }
}
