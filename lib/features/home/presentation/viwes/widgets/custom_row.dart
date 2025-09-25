import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/app_strings.dart';
import 'package:unique_supplement/core/utiles/styles.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.textStyle18),
        GestureDetector(
          onTap: onTap,
          child: Text(AppStrings.more, style: Styles.textStyle16),
        ),
      ],
    );
  }
}
