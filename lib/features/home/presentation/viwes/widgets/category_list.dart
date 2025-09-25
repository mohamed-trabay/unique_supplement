import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/widgets/custom_error_message.dart';
import 'package:unique_supplement/features/home/presentation/manger/categories_cubit/categories_cubit.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return SizedBox(
            height: 99.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,

              itemCount: 5,

              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: CategoryCard(),
                );
              },
            ),
          );
        } else if (state is CategoriesFailire) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
