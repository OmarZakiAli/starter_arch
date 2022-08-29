import 'package:flutter/material.dart';
import 'package:starter_arch/core/utils/local_storage_utils.dart';

class AppColors {
  Color get primary => Colors.green;

  Color get background =>
      LocalStorageUtils.isDarkMode() ? Colors.black : Colors.white;
}

extension AppThemingExtesion on BuildContext {
  AppColors get appColors => AppColors();
}
