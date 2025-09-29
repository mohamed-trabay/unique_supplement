import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/features/fav/presentation/manger/fav_cubit/fav_cubit.dart';
import 'package:unique_supplement/features/fav/presentation/views/widgets/fav_container.dart';

class FavList extends StatelessWidget {
  const FavList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavCubit>().loadFavorites();

    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoritesSuccess) {
          if (state.favorites.isEmpty) {
            return const Center(child: Text('لا يوجد عناصر مفضلة'));
          }
          return ListView.builder(
            itemCount: state.favorites.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return FavContainer(product: state.favorites[index]);
            },
          );
        } else if (state is FavoritesError) {
          return Center(child: Text('حدث خطأ: ${state.message}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
