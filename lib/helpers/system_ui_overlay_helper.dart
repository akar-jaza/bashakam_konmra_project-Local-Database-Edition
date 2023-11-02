// ignore: file_names
import 'package:bashakam_barawzanko/color/theme_colors.dart';
import 'package:flutter/services.dart';

class SystemUiOverlayHelper {
  void setDarkModeSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: ThemeColors.kMyCardColor,
        statusBarColor: const Color(0xFF1B1B1F),
        statusBarIconBrightness:
            Brightness.light, // Set the icon brightness to light
        systemNavigationBarIconBrightness: Brightness
            .light, // Set the system navigation bar icon brightness to light
      ),
    );
  }

  void setLightModeSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: const Color(0xffF3F3FA),
      statusBarColor: const Color(0xFFFEFBFF),
      statusBarIconBrightness:
          Brightness.light, // Set the icon brightness to light
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }
}
