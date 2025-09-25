import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: AppColors.lightBackground,
    textTheme: GoogleFonts.cairoTextTheme().apply(
      bodyColor: AppColors.lightText,
      displayColor: AppColors.lightText,
    ),
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 215, 233, 215),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: GoogleFonts.cairoTextTheme(
      ThemeData.dark().textTheme,
    ).apply(bodyColor: AppColors.darkText, displayColor: AppColors.darkText),
    colorScheme: const ColorScheme.dark(primary: AppColors.primary),
  );
}
