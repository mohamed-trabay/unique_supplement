import 'package:flutter/material.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/newest_items_body.dart';

class NewestItemsView extends StatelessWidget {
  const NewestItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: NewestItemsBody()));
  }
}
