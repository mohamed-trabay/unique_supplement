import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/core/utiles/service_locator.dart';
import 'package:unique_supplement/features/home/data/repos/home.repo.impl.dart';
import 'package:unique_supplement/features/home/presentation/manger/categories_cubit/categories_cubit.dart';
import 'package:unique_supplement/features/home/presentation/manger/newest_product_cubit/cubit/newest_product_cubit.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/home_view_body.dart';
import 'package:unique_supplement/features/profiel/presentation/views/custom_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  get providers => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) =>
                      CategoriesCubit(getIt.get<HomeRepoImpl>())
                        ..fetchcategories(),
            ),
            BlocProvider(
              create:
                  (context) =>
                      NewestProductCubit(getIt.get<HomeRepoImpl>())
                        ..fetchNewestProduct(),
            ),
          ],
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}
