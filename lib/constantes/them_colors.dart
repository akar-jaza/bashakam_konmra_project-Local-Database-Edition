// ignore_for_file: file_names
import 'dart:io';

import 'package:bashakam_barawzanko/helpers/system_ui_overlay_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  ThemeProvider({bool? isDark}) {
    if (isDark != null) {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    }
  }

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

  initilizePref() async {
    SharedPreferences.getInstance();
    notifyListeners();
  }
}

class MyThemes extends ChangeNotifier {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.light,
      primary: const Color(0xFF315DA8),
      onPrimary: const Color(0xFFFFFFFF),
      primaryContainer: const Color(0xFFD8E2FF),
      onPrimaryContainer: const Color(0xFF001A41),
      secondary: const Color(0xFF575E71),
      onSecondary: const Color(0xFFFFFFFF),
      secondaryContainer: const Color(0xFFDBE2F9),
      onSecondaryContainer: const Color(0xFF141B2C),
      tertiary: const Color(0xFF345CA8),
      onTertiary: const Color(0xFFFFFFFF),
      tertiaryContainer: const Color(0xFFD8E2FF),
      onTertiaryContainer: const Color(0xFF001A43),
      error: const Color(0xFFBA1A1A),
      errorContainer: const Color(0xFFFFDAD6),
      onError: const Color(0xFFFFFFFF),
      onErrorContainer: const Color(0xFF410002),
      background: const Color(0xFFFEFBFF),
      onBackground: const Color(0xFF1B1B1F),
      surface: const Color(0xffF3F3FA),
      onSurface: const Color(0xFF1B1B1F),
      surfaceVariant: const Color(0xFFE1E2EC),
      onSurfaceVariant: const Color(0xFF44474F),
      outline: const Color(0xFF74777F),
      onInverseSurface: const Color(0xFFF2F0F4),
      inverseSurface: const Color(0xFF303033),
      inversePrimary: const Color(0xFFADC6FF),
      shadow: const Color(0xFF000000),
      surfaceTint: const Color(0xFF315DA8),
      outlineVariant: const Color(0xFFC4C6D0),
      scrim: const Color(0xFF000000),
    ),
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(color: ThemeColors.kBodyTextColor),
    ),
    useMaterial3: true,
    fontFamily: 'rabarBold',
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness:
          ThemeProvider().isDarkMode ? Brightness.dark : Brightness.light,
      textTheme: const CupertinoTextThemeData(
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
      brightness: Brightness.dark,
      primary: const Color(0xFFADC6FF),
      onPrimary: const Color(0xFF002E69),
      primaryContainer: const Color(0xFF0E448E),
      onPrimaryContainer: const Color(0xFFD8E2FF),
      secondary: const Color(0xFFBFC6DC),
      onSecondary: const Color(0xFF293041),
      secondaryContainer: const Color(0xFF3F4759),
      onSecondaryContainer: const Color(0xFFDBE2F9),
      tertiary: const Color(0xFFAFC6FF),
      onTertiary: const Color(0xFF002D6C),
      tertiaryContainer: const Color(0xFF14448F),
      onTertiaryContainer: const Color(0xFFD8E2FF),
      error: const Color(0xFFFFB4AB),
      errorContainer: const Color(0xFF93000A),
      onError: const Color(0xFF690005),
      onErrorContainer: const Color(0xFFFFDAD6),
      background: const Color(0xFF1B1B1F),
      onBackground: const Color(0xFFE3E2E6),
      surface: ThemeColors.kMyCardColor,
      onSurface: const Color(0xFFE3E2E6),
      surfaceVariant: const Color(0xFF44474F),
      onSurfaceVariant: const Color(0xFFC4C6D0),
      outline: const Color(0xFF8E9099),
      onInverseSurface: const Color(0xFF1B1B1F),
      inverseSurface: const Color(0xFFE3E2E6),
      inversePrimary: const Color(0xFF315DA8),
      shadow: const Color(0xFF000000),
      surfaceTint: const Color(0xFFADC6FF),
      outlineVariant: const Color(0xFF44474F),
      scrim: const Color(0xFF000000),
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
  @override
  notifyListeners();
}

class ThemeColors {
  static const Color kBodyColor = Color(0xFF1B1B1F);
  static const Color kappBarColor =
      Color(0xFF292B35); // ❌ not used in color-scheme
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
  static const Color kappBarColor =
      Color(0xFFECEDF7); // ❌ not used in color-scheme
  static const Color kblueColor = Color(0xFF445E91);
  static const Color kOnBlueScondary = Color(0xFFFFFFFF); // KBoldBlueTextColor
  static const Color kBodyTextColor = Color(0xFF1B1B1F);
  static const Color kLightGreyTextColor = Color(0xFF45474F);
  static const Color kMyCardColor = Color(0xFFF2F3FD);
  static const Color kOutlinedTextfieldColor = Color(0xFF858486);
}

/** surface light: EDF4FD
 *  surface dark:  151D20
 */