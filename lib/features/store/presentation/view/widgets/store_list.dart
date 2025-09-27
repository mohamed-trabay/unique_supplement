import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/core/widgets/custom_error_message.dart';
import 'package:unique_supplement/core/widgets/custom_loading_indicator.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_item.dart';
import 'package:unique_supplement/features/store/presentation/manger/filtered_product_cubit/filtered_product_cubit.dart';

class StoreList extends StatelessWidget {
  const StoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredProductCubit, FilteredProductState>(
      builder: (context, state) {
        if (state is FilteredProductsSuccess) {
          //  final itemCount
          // limit != null && limit! < products.length
          //     ? limit!
          //     : products.length;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return CustomItem(productModel: state.products[index]);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 17,
              childAspectRatio: 2.4 / 4,
            ),
          );
        } else if (state is FilteredProductsFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return const CustomLoadingIndicator();
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 17,
              childAspectRatio: 2.4 / 4,
            ),
          );
        }
      },
    );
  }
}
