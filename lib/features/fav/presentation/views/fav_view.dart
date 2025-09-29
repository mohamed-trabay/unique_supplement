import 'package:flutter/material.dart';
import 'package:unique_supplement/features/fav/presentation/views/widgets/fav_view_body.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: const FavViewBody()));
  }
}
