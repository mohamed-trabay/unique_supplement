import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as custom_badge;
import 'package:unique_supplement/core/utiles/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final int favCount;
  final int cartCount;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.favCount = 0,
    this.cartCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.background(context),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, 'الرئيسيه', 0),
          _buildNavItem(
            Icons.favorite_outline,
            'المفضله',
            1,
            badgeCount: favCount,
          ),
          _buildNavItem(
            Icons.shopping_cart_outlined,
            'العربه',
            2,
            badgeCount: cartCount,
          ),
          _buildNavItem(Icons.store_outlined, 'المتجر', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index, {
    int badgeCount = 0,
  }) {
    final isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: custom_badge.Badge(
        showBadge: badgeCount > 0,
        badgeContent: Text(
          '$badgeCount',
          style: TextStyle(color: Colors.white, fontSize: 10.sp),
        ),
        position: custom_badge.BadgePosition.topEnd(top: 15, end: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.black : Colors.grey),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
