import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:starter_arch/core/utils/local_storage_utils.dart';

class AppTextStyles {
  TextStyle get title => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: LocalStorageUtils.isDarkMode() ? Colors.white : Colors.black);

  TextStyle get subTitle => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: LocalStorageUtils.isDarkMode() ? Colors.white : Colors.blueGrey);
}
