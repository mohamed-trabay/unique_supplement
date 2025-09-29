import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:unique_supplement/features/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:unique_supplement/features/cart/presentation/view/cart_view.dart';
import 'package:unique_supplement/features/fav/presentation/manger/fav_cubit/fav_cubit.dart';
import 'package:unique_supplement/features/fav/presentation/views/fav_view.dart';
import 'package:unique_supplement/features/home/presentation/viwes/home_view.dart';
import 'package:unique_supplement/features/main_layout/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:unique_supplement/features/store/presentation/view/store_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  late PageController _pageController;

  final List<Widget> _screens = const [
    HomeView(),
    FavView(),
    CartView(),
    StoreView(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    context.read<FavCubit>().loadFavorites();
    context.read<CartCubit>().loadCart();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: _screens,
      ),
      bottomNavigationBar: BlocBuilder<FavCubit, FavState>(
        builder: (context, favState) {
          int favCount = 0;
          if (favState is FavoritesSuccess) {
            favCount = favState.favorites.length;
          }

          return BlocBuilder<CartCubit, CartState>(
            builder: (context, cartState) {
              int cartCount = 0;
              if (cartState is CartLoaded) {
                cartCount = cartState.items.length;
              }

              return CustomBottomNav(
                currentIndex: _currentIndex,
                favCount: favCount,
                cartCount: cartCount,
                onTap: (index) {
                  setState(() => _currentIndex = index);
                  _pageController.jumpToPage(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
