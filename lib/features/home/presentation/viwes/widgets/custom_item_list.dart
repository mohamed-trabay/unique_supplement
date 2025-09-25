import 'package:flutter/material.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_item.dart';

class CustomItemList extends StatelessWidget {
  const CustomItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,

      itemBuilder: (context, index) {
        return const CustomItem();
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 17,
        childAspectRatio: 2.4 / 4,
      ),
    );
  }
}
