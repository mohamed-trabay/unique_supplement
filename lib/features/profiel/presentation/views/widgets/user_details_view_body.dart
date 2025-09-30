import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/widgets/custom_app_bar.dart';
import 'package:unique_supplement/features/profiel/presentation/views/widgets/user_details_form.dart';

class UserDetailsViewBody extends StatelessWidget {
  const UserDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: Column(
          children: [
            const CustomAppBar(title: 'معلومات المستخدم'),
            SizedBox(height: 26.h),
            UserDetailsForm(),
          ],
        ),
      ),
    );
  }
}
