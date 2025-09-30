import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/utiles/assets.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/features/profiel/presentation/manger/user_cubit/user_cubit.dart';

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
          _buildProfileHeader(context),
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
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
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
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.user.firstName} ${state.user.lastName}',
                        style: Styles.textStyle18,
                      ),
                      Text(
                        state.user.email,
                        style: Styles.textStyle14.copyWith(
                          color: AppColors.greyprimmary,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('اسم المستخدم', style: Styles.textStyle18),
                      Text(
                        'البريد الإلكتروني',
                        style: Styles.textStyle14.copyWith(
                          color: AppColors.greyprimmary,
                        ),
                      ),
                    ],
                  );
                }
              },
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
