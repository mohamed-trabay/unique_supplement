import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_supplement/core/utiles/app_router.dart';
import 'package:unique_supplement/core/utiles/assets.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              AssetsData.logo,
              height: 40.h,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            left: 0,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search, size: 28),
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kSerchView);
                  },
                ),
                SizedBox(width: 10.w),
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kCartView);
                  },
                  icon: const Icon(Icons.shopping_cart_outlined, size: 28),
                ),
              ],
            ),
          ),

          Positioned(
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.menu, size: 28),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
