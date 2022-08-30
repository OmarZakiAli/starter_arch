import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starter_arch/theme/app_text_styles.dart';

import 'app_colors.dart';

extension AppThemingExtesion on ThemeData {
  AppColors get appColors => AppColors();
  AppTextStyles get appTextStyles => AppTextStyles();
}

class AppThemes {
  static ThemeData light = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors().primary,
      fontFamily: GoogleFonts.cairo().fontFamily,
      scaffoldBackgroundColor: AppColors().background);

  static ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors().primary,
      fontFamily: GoogleFonts.cairo().fontFamily,
      scaffoldBackgroundColor: AppColors().background);
}
