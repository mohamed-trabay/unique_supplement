import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/utiles/assets.dart';
import 'package:unique_supplement/core/utiles/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Center(child: Text(AppStrings.profile, style: Styles.textStyle24)),
          SizedBox(height: 10.h),
          _buildProfileHeader(),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            endIndent: 20,
            indent: 20,
          ),

          CustomDrawerItem(
            icon: Icons.shopping_bag_outlined,
            title: AppStrings.pastOrders,
            onTap: () => Navigator.pop(context),
          ),
          CustomDrawerItem(
            icon: Icons.replay_outlined,
            title: AppStrings.refund,
            onTap: () {},
          ),
          CustomDrawerItem(
            icon: Icons.privacy_tip_outlined,
            title: AppStrings.privacy,
            onTap: () {},
          ),
          CustomDrawerItem(
            icon: Icons.description_outlined,
            title: AppStrings.terms,
            onTap: () {},
          ),
          CustomDrawerItem(
            icon: Icons.info_outline,
            title: AppStrings.aboutUs,
            onTap: () {},
          ),

          // const Divider(
          //   thickness: 1,
          //   color: Colors.grey,
          //   endIndent: 20,
          //   indent: 20,
          // ),

          // CustomDrawerItem(
          //   icon: Icons.logout,
          //   title: AppStrings.logout,
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(16.r),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            height: 60.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage(AssetsData.profielUser),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('محمد نبيل', style: Styles.textStyle18),
                Text(
                  'Mohamed@gmail.com',
                  style: Styles.textStyle14.copyWith(
                    color: AppColors.greyprimmary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
