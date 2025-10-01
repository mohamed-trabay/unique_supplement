import 'package:flutter/material.dart';
import 'package:unique_supplement/features/fav/presentation/views/widgets/add_all_cart.dart';
import 'package:unique_supplement/features/fav/presentation/views/widgets/fav_view_body.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20.0),
          child: AddAllToCartButton(),
        ),
        body: FavViewBody(),
      ),
    );
  }
}
