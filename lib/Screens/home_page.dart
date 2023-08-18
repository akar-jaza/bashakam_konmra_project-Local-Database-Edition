import 'dart:io';

import 'package:bashakam_barawzanko/Screens/department_introduction/department_introduction_screen.dart';
import 'package:bashakam_barawzanko/Screens/kamtrin_konmra/kamtrin_konmra_page.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  String homePageTitle = "لەگەڵ بەشەکەم، زانیاری لەسەر بەشەکەت";

  @override
  void initState() {
    super.initState();
    uiOverlayFunc.setSystemUiOverlayStyle();
  }

  @override
  Widget build(BuildContext context) {
    double calculateTextFontSize(BuildContext context) {
      final screenSize = MediaQuery.of(context).size;
      final screenWidth = screenSize.width;

      if (screenWidth < 400) {
        return 16; // Small screen
      } else if (screenWidth < 600) {
        return 20; // Medium screen
      } else {
        return 20; // Large screen
      }
    }

    return Scaffold(
      backgroundColor: ThemeColors.kBodyColor,
      appBar: const HomePageAppBar(),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                SvgPicture.asset(
                  'assets/images/cats.svg',
                  width: MediaQuery.of(context).size.width < 700
                      ? MediaQuery.of(context).size.width * 0.5
                      : 270,
                ),
                const SizedBox(
                  height: 30,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: RichText(
                      text: TextSpan(
                        children: const <TextSpan>[
                          TextSpan(
                            text:
                                'لەگەڵ بەشەکەم، زانیاری لەسەر بەشەکەت ببینە \u{1F393}',
                          ),
                        ],
                        style: TextStyle(
                          fontSize: calculateTextFontSize(context),
                          color: ThemeColors.kWhiteTextColor,
                          fontFamily: 'rabarBold',
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'ڕیزبەندی بکە، ڕیزبەندیەکانت ببینە، زانیاری لەسەر بەشەکان ببینە',
                    style: TextStyle(
                      color: ThemeColors.kGreyTextColor,
                      fontSize: calculateTextFontSize(context) - 4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyCard(
                      imageAsset: 'assets/images/list3.svg',
                      buttonTitle: 'ببینە',
                      color: ThemeColors.kWhiteTextColor,
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
                      color: ThemeColors.kWhiteTextColor,
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
                                return const KamtrinKonmra();
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
                      color: ThemeColors.kWhiteTextColor,
                      text: 'ڕیزبەندیەکانم',
                    ),
                    MyCard(
                      imageAsset: 'assets/images/departments.svg',
                      buttonTitle: 'ببینە',
                      color: ThemeColors.kWhiteTextColor,
                      text: 'بەشەکان',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
