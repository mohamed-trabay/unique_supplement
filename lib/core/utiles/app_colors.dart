// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  //  Primary Brand Color
  static const Color primary = Colors.green;

  //  Light Theme Colors
  static const Color lightBackground = Colors.white;
  static const Color lightText = Colors.black;

  //  Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212); // ممكن تغيره حسب ذوقك
  static const Color darkText = Colors.white;

  // Common Colors
  static const Color yellowPrimary = Color(0xFFF2D52A);
  static const Color greyprimmary = Color(0xffA7A8A7);
  // these colors can be used in both themes
  static Color background(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black;
  }

  static Color shadowColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black.withOpacity(0.3)
        : Colors.grey.withOpacity(0.2);
  }
}
