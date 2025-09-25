import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_forward, size: 25),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Expanded(child: Center(child: Text(title, style: Styles.textStyle18))),
        SizedBox(width: 48.w),
      ],
    );
  }
}
