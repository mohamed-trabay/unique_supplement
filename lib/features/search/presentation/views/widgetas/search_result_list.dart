import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_item.dart';
import 'package:unique_supplement/features/search/presentation/views/manger/search_cubit/search_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          if (state.products.isEmpty) {
            return const Center(child: Text('لا توجد نتائج'));
          }
          return GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
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
        } else if (state is SearchFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const Center(child: Text('ابحث لعرض النتائج'));
      },
    );
  }
}
