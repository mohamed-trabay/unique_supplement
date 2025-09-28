import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/features/store/presentation/manger/filtered_product_cubit/filtered_product_cubit.dart';
import 'package:unique_supplement/features/store/presentation/view/widgets/store_appbar.dart';
import 'package:unique_supplement/features/store/presentation/view/widgets/store_list.dart';

class StoreViewBody extends StatelessWidget {
  const StoreViewBody({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    context.read<FilteredProductCubit>().fetchFilteredProducts();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _onRefresh(context),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: EdgeInsets.all(20.0.r),
        child: Column(
          children: [
            const StoreAppBar(),
            SizedBox(height: 30.h),
            const StoreList(),
          ],
        ),
      ),
    );
  }
}
