import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/features/payment/data/order_service.dart';
import 'package:unique_supplement/features/payment/presentation/mander/order_cubit/order_cubit.dart';
import 'package:unique_supplement/features/profiel/presentation/manger/user_cubit/user_cubit.dart';
import 'package:unique_supplement/features/profiel/presentation/views/widgets/user_details_view_body.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key, required this.amount});
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => UserCubit()..loadUser()),
            BlocProvider(create: (context) => OrderCubit(OrderService())),
          ],
          child: UserDetailsViewBody(amount: amount),
        ),
      ),
    );
  }
}
