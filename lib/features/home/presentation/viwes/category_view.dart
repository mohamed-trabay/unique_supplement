import 'package:flutter/material.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: CategoryViewBody()));
  }
}
