import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/core/utiles/service_locator.dart';
import 'package:unique_supplement/features/home/data/repos/home.repo.impl.dart';
import 'package:unique_supplement/features/home/presentation/manger/categories_cubit/categories_cubit.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create:
              (context) =>
                  CategoriesCubit(getIt.get<HomeRepoImpl>())..fetchCategories(),
          child: const CategoryViewBody(),
        ),
      ),
    );
  }
}
