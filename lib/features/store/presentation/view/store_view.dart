import 'package:flutter/material.dart';
import 'package:unique_supplement/features/store/presentation/view/widgets/store_view_body.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: StoreViewBody()));
  }
}
