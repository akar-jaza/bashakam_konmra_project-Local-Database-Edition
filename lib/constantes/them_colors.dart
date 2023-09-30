// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ThemeClass {
  Color lightPrimaryColor = const Color(0xFF445E91); //kblueColor
  Color darkPrimaryColor = const Color(0xFFADC6FF); //kblueColor

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: ThemeClass().lightPrimaryColor,
    ),
    // colorSchemeSeed: ColorScheme(
    //     brightness: brightness,
    //     primary: primary,
    //     onPrimary: onPrimary,
    //     secondary: secondary,
    //     onSecondary: onSecondary,
    //     error: error,
    //     onError: onError,
    //     background: background,
    //     onBackground: onBackground,
    //     surface: surface,
    //     onSurface: onSurface)
  );
}

class ThemeColors {
  static const Color kBodyColor = Color(0xFF1B1B1F);
  static const Color kappBarColor = Color(0xFF292B35);
  static const Color kblueColor = Color(0xFFADC6FF);
  static const Color kBoldBlueTextColor = Color(0xFF0F2F64);
  static const Color kBodyTextColor = Color(0xFFE4E2E6); //White Text Color
  static const Color kLightGreyTextColor = Color(0xFFC5C6D1);
  static const Color kMyCardColor = Color(0xFF22232B);
  static const Color kOutlinedTextfieldColor = Color(0xFF948F9A);
  // static const Color kTextfieledIsEmptyColor = Color(0xFFF2B9B6);
}

class WhiteThemeColors {
  static const Color kBodyColor = Color(0xFFFAF9FF);
  static const Color kappBarColor = Color(0xFFECEDF7);
  static const Color kblueColor = Color(0xFF445E91);
  static const Color kBoldBlueTextColor = Color(0xFF445E91);
  static const Color kBodyTextColor = Color(0xFF1B1B1F);
  static const Color kLightGreyTextColor = Color(0xFF45474F);
  static const Color kMyCardColor = Color(0xFFF2F3FD);
  static const Color kOutlinedTextfieldColor = Color(0xFF858486);
}
