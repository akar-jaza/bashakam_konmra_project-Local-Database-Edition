// ignore_for_file: unnecessary_string_interpolations

import 'dart:io';

import 'package:bashakam_barawzanko/Screens/Home_screen/home_page.dart';
import 'package:bashakam_barawzanko/Screens/Setting_screen/main_setting_screen.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: Platform.isIOS ? 60 : 70,
          labelTextStyle: WidgetStateProperty.all(
            TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        child: NavigationBar(
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          backgroundColor: Theme.of(context).colorScheme.surface,
          indicatorColor: Theme.of(context).colorScheme.primaryContainer,
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) => setState(() {
            selectedIndex = value;
          }),
          destinations: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: NavigationDestination(
                selectedIcon: Icon(
                  CupertinoIcons.house_fill,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: 22,
                ),
                icon: Icon(
                  CupertinoIcons.house,
                  color: Theme.of(context).colorScheme.onBackground,
                  size: 22,
                ),
                label: "سەرەکی",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: NavigationDestination(
                selectedIcon: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                icon: Icon(
                  Icons.settings_outlined,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                label: "ڕێکخستنەکان",
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: HomePageAppBar(title: _appBarTitles[selectedIndex]),
      appBar: MyCupertinoAppBar(
        enableLeading: false,
        middleText: '${_appBarTitles[selectedIndex]}',
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        switchInCurve: Easing.legacy,
        child: screens[selectedIndex],
      ),
    );
  }
}
