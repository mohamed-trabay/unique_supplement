import 'package:flutter/material.dart';
import 'package:unique_supplement/features/cart/presentation/view/widgets/cart_container.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const CartContainer(),
    );
  }
}
