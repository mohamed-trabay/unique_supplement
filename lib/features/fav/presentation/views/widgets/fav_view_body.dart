import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/widgets/center_title.dart';
import 'package:unique_supplement/core/widgets/custom_text_field.dart';
import 'package:unique_supplement/features/fav/presentation/views/widgets/fav_list.dart';

class FavViewBody extends StatelessWidget {
  const FavViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.r),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CenteredTitle(title: AppStrings.fav),
            SizedBox(height: 19.h),
            const CustomTextField(),

            SizedBox(height: 16.h),
            const FavList(),
          ],
        ),
      ),
    );
  }
}
