import 'package:flutter/material.dart';
import 'package:unique_supplement/features/cart/presentation/view/cart_view.dart';
import 'package:unique_supplement/features/fav/presentation/views/fav_view.dart';
import 'package:unique_supplement/features/home/presentation/viwes/home_view.dart';
import 'package:unique_supplement/features/main_layout/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:unique_supplement/features/store/presentation/view/store_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required Widget child});

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
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
          // لو عايز انيميشن:
          // _pageController.animateToPage(
          //   index,
          //   duration: const Duration(milliseconds: 300),
          //   curve: Curves.easeInOut,
          // );
        },
      ),
    );
  }
}
