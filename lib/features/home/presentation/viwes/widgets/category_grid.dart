import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/core/widgets/custom_error_message.dart';
import 'package:unique_supplement/core/widgets/custom_loading_indicator.dart';
import 'package:unique_supplement/features/home/presentation/manger/categories_cubit/categories_cubit.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/category_card.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return GridView.builder(
            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.categories.length,

            itemBuilder: (context, index) {
              return CategoryCard(categoryModel: state.categories[index]);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 2.5 / 4,
            ),
          );
        } else if (state is CategoriesFailire) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 16,
              itemBuilder: (context, index) {
                return CustomLoadingIndicator(
                  isCircle: true,

                  borderRadius: BorderRadius.circular(12),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 2.5 / 4,
              ),
            ),
          );
        }
      },
    );
  }
}
