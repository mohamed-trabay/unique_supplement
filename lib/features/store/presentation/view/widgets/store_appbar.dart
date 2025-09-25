import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/widgets/center_title.dart';
import 'package:unique_supplement/features/store/presentation/view/widgets/filter_sheet.dart';

class StoreAppBar extends StatelessWidget {
  const StoreAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 28.w),
        const CenteredTitle(title: AppStrings.allProduct),
        IconButton(
          icon: const Icon(Icons.filter_list, size: 28),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => const FilterSheet(),
            );
          },
        ),
      ],
    );
  }
}
