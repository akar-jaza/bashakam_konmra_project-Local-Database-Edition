// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode selectedTheme = ThemeMode.light; // Default to light theme

  ThemeMode get getSelectedTheme => selectedTheme;

  void setTheme(ThemeMode theme) {
    selectedTheme = theme;
    notifyListeners();
  }
}

class MyThemes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: WhiteThemeColors.kblueColor, // primary color
      onPrimary: WhiteThemeColors.kBoldBlueTextColor,
      background: WhiteThemeColors.kBodyColor, // background color
      surface: WhiteThemeColors.kMyCardColor, // card color
    ),
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(color: ThemeColors.kBodyTextColor),
    ),
    useMaterial3: true,
    fontFamily: 'rabarBold',
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        navTitleTextStyle: TextStyle(fontFamily: "rabarBold"),
        textStyle: TextStyle(
          fontFamily: "rabarBold",
        ),
        actionTextStyle: TextStyle(
          fontFamily: "rabarBold",
        ),
        navLargeTitleTextStyle: TextStyle(
          fontFamily: "rabarBold",
        ),
      ),
    ),
    splashFactory:
        Platform.isIOS ? NoSplash.splashFactory : InkSparkle.splashFactory,
    highlightColor: Platform.isIOS
        ? Colors.transparent
        : ThemeColors.kblueColor.withOpacity(0.2),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        letterSpacing: 0.0,
      ),
      bodyMedium: TextStyle(
        letterSpacing: 0.0,
      ),
      labelLarge: TextStyle(
        letterSpacing: 0.0,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ThemeColors.kBodyTextColor,
    ),
    scaffoldBackgroundColor: ThemeColors.kBodyColor,
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(color: WhiteThemeColors.kBodyTextColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColors.kBodyColor,
      surfaceTintColor: ThemeColors.kblueColor,
    ),
    useMaterial3: true,
    fontFamily: 'rabarBold',
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        navTitleTextStyle: TextStyle(fontFamily: "rabarBold"),
        textStyle: TextStyle(
          fontFamily: "rabarBold",
        ),
        actionTextStyle: TextStyle(
          fontFamily: "rabarBold",
        ),
        navLargeTitleTextStyle: TextStyle(
          fontFamily: "rabarBold",
        ),
      ),
    ),
    splashFactory:
        Platform.isIOS ? NoSplash.splashFactory : InkSparkle.splashFactory,
    highlightColor: Platform.isIOS
        ? Colors.transparent
        : ThemeColors.kblueColor.withOpacity(0.2),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        letterSpacing: 0.0,
      ),
      bodyMedium: TextStyle(
        letterSpacing: 0.0,
      ),
      labelLarge: TextStyle(
        letterSpacing: 0.0,
      ),
    ),
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
