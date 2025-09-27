import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/features/store/presentation/view/widgets/store_appbar.dart';
import 'package:unique_supplement/features/store/presentation/view/widgets/store_list.dart';

class StoreViewBody extends StatelessWidget {
  const StoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.r),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const StoreAppBar(),
            SizedBox(height: 30.h),
            const StoreList(),
          ],
        ),
      ),
    );
  }
}
