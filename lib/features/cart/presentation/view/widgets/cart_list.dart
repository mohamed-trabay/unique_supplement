import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/features/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:unique_supplement/features/cart/presentation/view/widgets/cart_container.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartLoaded) {
          final items = state.items;
          if (items.isEmpty) {
            return const Center(child: Text('العربه فارغه'));
          }

          return ListView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final cartItem = items[index];
              return CartContainer(cartitem: cartItem);
            },
          );
        } else if (state is CartError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
