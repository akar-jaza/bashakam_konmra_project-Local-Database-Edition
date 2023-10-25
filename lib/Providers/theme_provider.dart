
import 'package:bashakam_barawzanko/helpers/system_ui_overlay_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider({bool? isDark}) {
    if (isDark != null) {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    }
  }

  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isOn) {
      themeMode = ThemeMode.dark;
      SystemUiOverlayHelper().setDarkModeSystemUiOverlayStyle();
      sharedPreferences.setBool('_isDark', true);
    } else {
      themeMode = ThemeMode.light;
      SystemUiOverlayHelper().setLightModeSystemUiOverlayStyle();
      sharedPreferences.setBool('_isDark', false);
    }
    notifyListeners();
  }

  // Future<void> setTheme(int index) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   if (index == 0) {
  //     themeMode = ThemeMode.light;
  //     SystemUiOverlayHelper().setLightModeSystemUiOverlayStyle();
  //     sharedPreferences.setBool('_isDark', false);
  //   } else if (index == 1) {
  //     themeMode = ThemeMode.dark;
  //     SystemUiOverlayHelper().setDarkModeSystemUiOverlayStyle();
  //     sharedPreferences.setBool('_isDark', true);
  //   } else if (index == 2) {
  //     final brightness = PlatformDispatcher.instance.platformBrightness;

  //     if (brightness == Brightness.dark) {
  //       themeMode = ThemeMode.system;
  //       SystemUiOverlayHelper().setDarkModeSystemUiOverlayStyle();
  //       sharedPreferences.setBool('_isDark', true);
  //        notifyListeners();
  //     } else if (brightness == Brightness.light) {
  //       themeMode = ThemeMode.system;
  //       SystemUiOverlayHelper().setLightModeSystemUiOverlayStyle();
  //       sharedPreferences.setBool('_isDark', false);
  //        notifyListeners();
  //     }
  //   }
  //   notifyListeners();
  // }
}
