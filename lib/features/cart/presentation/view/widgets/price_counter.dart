import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/features/cart/data/models/cart_model.dart';
import 'package:unique_supplement/core/widgets/custom_counter.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/features/cart/presentation/manger/cubit/cart_cubit.dart';

class PriceCounter extends StatelessWidget {
  final CartItemModel cartItem;
  const PriceCounter({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCounter(
          initialValue: cartItem.quantity,
          onChanged: (val) {
            context.read<CartCubit>().updateQuantity(cartItem, val);
          },
        ),
        Text(
          '${cartItem.totalPrice.toStringAsFixed(2)} ر.س',
          style: Styles.textStyle14Bold,
        ),
      ],
    );
  }
}
