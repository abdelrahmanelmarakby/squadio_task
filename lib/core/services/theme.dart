import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squadio_task/core/resourses/color_manger.dart';
import 'package:squadio_task/core/resourses/theme_manger.dart';

class Themes {
  static final light = getApplicationTheme();
  static final dark = getApplicationTheme().copyWith(
    brightness: Brightness.dark,
    primaryColor: ColorsManger.primaryDark,
    scaffoldBackgroundColor: Colors.black87,
    cardColor: Colors.black87,
  );
}

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme() {
    print("clicked");
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
