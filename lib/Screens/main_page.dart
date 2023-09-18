import 'package:bashakam_barawzanko/Screens/Home_screen/home_page.dart';
import 'package:bashakam_barawzanko/Screens/Setting_screen/setting_screen.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';
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
  SystemUiOverlayHelper uiOverlayFunc = SystemUiOverlayHelper();
  int selectedIndex = 0;
  final screens = [
    const HomePage(),
    const SettingScreen(),
  ];

  @override
  void initState() {
    super.initState();
    uiOverlayFunc.setSystemUiOverlayStyle();
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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: ThemeColors.kMyCardColor,
        statusBarColor: ThemeColors.kBodyColor,
        statusBarIconBrightness:
            Brightness.light, // Set the icon brightness to light
        systemNavigationBarIconBrightness: Brightness
            .light, // Set the system navigation bar icon brightness to light
      ),
      child: Scaffold(
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            height: 60,
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
                    Icons.home,
                    color: ThemeColors.kBodyColor,
                  ),
                  icon: Icon(
                    Icons.home_outlined,
                    color: ThemeColors.kBodyTextColor,
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
        appBar: const HomePageAppBar(),
        body: screens[selectedIndex],
      ),
    );
  }
}
