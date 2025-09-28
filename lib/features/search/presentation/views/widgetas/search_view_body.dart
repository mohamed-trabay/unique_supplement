import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/styles.dart';
import 'package:unique_supplement/core/widgets/custom_app_bar.dart';
import 'package:unique_supplement/core/widgets/custom_text_field.dart';
import 'package:unique_supplement/features/search/presentation/views/widgetas/search_result_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: 'البحث'),
          SizedBox(height: 20.h),

          const CustomTextField(),
          SizedBox(height: 16.h),
          Text('Results', style: Styles.textStyle18),
          SizedBox(height: 16.h),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
