import 'dart:io';

import 'package:bashakam_barawzanko/Screens/department_introduction/department_introduction_screen.dart';
import 'package:bashakam_barawzanko/Screens/kamtrin_konmra/kamtrin_konmra_page.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/my_card.dart';
import '../components/my_homepage_appbar.dart';
import '../helpers/systemUi_overlay_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SystemUiOverlayHelper uiOverlayFunc = SystemUiOverlayHelper();
  int selectedIndex = 0;

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
    double textWidth = MediaQuery.of(context).size.width;

    double width = textWidth < 380 // Galaxy S8 aspect ratio
        ? 280
        : textWidth > 380 // iphone 13 pro aspect ratio
            ? 350
            : 350; // Default width if neither condition is met

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
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/images/cats.svg',
                      width: MediaQuery.of(context).size.width < 700
                          ? MediaQuery.of(context).size.width * 0.5
                          : 270,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'لەگەڵ بەشەکەم، زانیاری لەسەر بەشەکەت ببینە',
                      style: TextStyle(
                        fontSize: 17,
                        color: ThemeColors.kBodyTextColor,
                        fontFamily: 'rabarBold',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'کەمترین کۆنمرە ببینە، زانیاری لەسەر بەشەکان ببینە، داهاتووی بەشەکت ببینە',
                        style: TextStyle(
                          color: ThemeColors.kLightGreyTextColor,
                          fontSize: textWidth < 380
                              ? 13
                              : 14, //calculateTextFontSize(context) - 4
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15, //30
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyCard(
                        imageAsset: 'assets/images/list3.svg',
                        buttonTitle: 'ببینە',
                        color: ThemeColors.kBodyTextColor,
                        text: 'کەمترین کۆنمرە',
                        onTap: () {
                          if (Platform.isIOS) {
                            Navigator.of(context, rootNavigator: true).push(
                              CupertinoPageRoute<bool>(
                                fullscreenDialog: false,
                                builder: (BuildContext context) =>
                                    const KamtrinKonmra(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const KamtrinKonmra();
                                },
                              ),
                            );
                          }
                        },
                      ),
                      MyCard(
                        imageAsset: 'assets/images/departments.svg',
                        buttonTitle: 'ببینە',
                        color: ThemeColors.kBodyTextColor,
                        text: 'بەشەکان',
                        onTap: () {
                          if (Platform.isIOS) {
                            Navigator.of(context, rootNavigator: true).push(
                              CupertinoPageRoute<bool>(
                                fullscreenDialog: false,
                                builder: (BuildContext context) =>
                                    const DepartmentIntroductionScreen(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DepartmentIntroductionScreen();
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyCard(
                        imageAsset: 'assets/images/zarabin.svg',
                        buttonTitle: 'ببینە',
                        color: ThemeColors.kBodyTextColor,
                        text: 'ڕیزبەندیەکانم',
                      ),
                      MyCard(
                        imageAsset: 'assets/images/departments.svg',
                        buttonTitle: 'ببینە',
                        color: ThemeColors.kBodyTextColor,
                        text: 'بەشەکان',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
