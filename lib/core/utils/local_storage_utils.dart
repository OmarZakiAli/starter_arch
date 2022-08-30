import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

class LocalStorageUtils {
  static final Box _appBox = Hive.box("appBox");

  static init() async {
    await Hive.initFlutter();
    await Hive.openBox("appBox");
  }

  static ValueListenable listenToTheme() {
    return _appBox.listenable(keys: ["is_dark_mode"]);
  }

  static bool isLogin() {
    return _appBox.get("is_login", defaultValue: false);
  }

  static setLogin(bool isLogin) async {
    await _appBox.put("is_login", isLogin);
  }

  static bool isDarkMode() {
    return _appBox.get("is_dark_mode", defaultValue: false);
  }

  static setIsDarkMode(bool isDarkMode) async {
    await _appBox.put("is_dark_mode", isDarkMode);
  }
}
