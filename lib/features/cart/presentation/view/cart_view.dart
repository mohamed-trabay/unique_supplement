import 'package:flutter/material.dart';
import 'package:unique_supplement/features/cart/presentation/view/widgets/cart_view_body.dart';
import 'package:unique_supplement/features/cart/presentation/view/widgets/order_detail.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(body: CartViewBody(), bottomNavigationBar: OrderDetail()),
    );
  }
}
