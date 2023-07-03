import 'package:flutter/material.dart';
import 'package:properties/core/cache_manager/cache_manager.dart';
import 'package:properties/resource/app_strings.dart';


class ThemeManager extends ChangeNotifier {
  ThemeManager() {
    isDarkTheme();
  }

  bool isDark = false;
  final CacheManager cacheManager = CacheManager.instance;

  Future<bool?> isDarkTheme() async {
    final themeStatus = await cacheManager.getPref(themeKey) as bool?;
    if (themeStatus != null) {
      isDark = themeStatus;
      return themeStatus;
    }
    return null;
  }

  Future<void> switchDarkTheme(bool condition) async {
    await cacheManager.storePref(themeKey, !isDark);
    notifyListeners();
  }
}
