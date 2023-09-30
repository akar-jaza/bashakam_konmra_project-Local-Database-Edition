// ignore_for_file: unnecessary_string_interpolations

import 'dart:io';

import 'package:bashakam_barawzanko/Screens/Home_screen/home_page.dart';
import 'package:bashakam_barawzanko/Screens/Setting_screen/main_setting_screen.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/my_homepage_appbar.dart';
import '../helpers/systemUi_overlay_helper.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final screens = [
    const HomePage(),
    const IOSHomePage(),
  ];

  final List<String> _appBarTitles = [
    'بەشەکەم \u{1F393}',
    'ڕێکخستنەکان',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double calculateTextFontSize(BuildContext context) {
    //   final screenSize = MediaQuery.of(context).size;
    //   final screenWidth = screenSize.width;
    //   if (screenWidth < 300) {
    //     return 14;
    //   } else if (screenWidth < 400) {
    //     return 16; // Small screen
    //   } else if (screenWidth < 600) {
    //     return 20; // Medium screen
    //   } else {
    //     return 20; // Large screen
    //   }
    // }
    // uiOverlayFunc.setSystemUiOverlayStyle();

    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: Platform.isIOS ? 60 : 70,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              color: ThemeColors.kBodyTextColor,
            ),
          ),
        ),
        child: NavigationBar(
          surfaceTintColor: ThemeColors.kMyCardColor,
          backgroundColor: ThemeColors.kMyCardColor,
          indicatorColor: ThemeColors.kblueColor,
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) => setState(() {
            selectedIndex = value;
          }),
          destinations: const [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: NavigationDestination(
                selectedIcon: Icon(
                  CupertinoIcons.house_fill,
                  color: ThemeColors.kBodyColor,
                  size: 22,
                ),
                icon: Icon(
                  CupertinoIcons.house,
                  color: ThemeColors.kBodyTextColor,
                  size: 22,
                ),
                label: "سەرەکی",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: NavigationDestination(
                selectedIcon: Icon(
                  Icons.settings,
                  color: ThemeColors.kBodyColor,
                ),
                icon: Icon(
                  Icons.settings_outlined,
                  color: ThemeColors.kBodyTextColor,
                ),
                label: "ڕێکخستنەکان",
              ),
            ),
          ],
        ),
      ),
      backgroundColor: ThemeColors.kBodyColor,
      // appBar: HomePageAppBar(title: _appBarTitles[selectedIndex]),
      appBar: MyCupertinoAppBar(
        enableLeading: false,
        middleText: '${_appBarTitles[selectedIndex]}',
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        switchInCurve: standardEasing,
        child: screens[selectedIndex],
      ),
    );
  }
}
