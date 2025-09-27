import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/core/utiles/service_locator.dart';
import 'package:unique_supplement/features/store/data/repo/store_repo_impl.dart';
import 'package:unique_supplement/features/store/presentation/manger/filtered_product_cubit/filtered_product_cubit.dart';
import 'package:unique_supplement/features/store/presentation/view/widgets/store_view_body.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create:
              (context) =>
                  FilteredProductCubit(getIt.get<StoreRepoImpl>())
                    ..fetchFilteredProducts(),
          child: const StoreViewBody(),
        ),
      ),
    );
  }
}
