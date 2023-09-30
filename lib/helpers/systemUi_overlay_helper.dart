// ignore: file_names
import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/services.dart';

class SystemUiOverlayHelper {
  void setSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: ThemeColors.kMyCardColor,
        statusBarColor: ThemeColors.kBodyColor,
        statusBarIconBrightness:
            Brightness.light, // Set the icon brightness to light
        systemNavigationBarIconBrightness: Brightness
            .light, // Set the system navigation bar icon brightness to light
      ),
    );
  }
}
