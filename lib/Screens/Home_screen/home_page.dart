import 'dart:io';

import 'package:bashakam_barawzanko/Screens/department_introduction/department_introduction_screen.dart';
import 'package:bashakam_barawzanko/Screens/kamtrin_konmra/kamtrin_konmra_page.dart';
import 'package:bashakam_barawzanko/components/my_card.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // double textWidth = MediaQuery.of(context).size.width;

    // double width = textWidth < 380 // Galaxy S8 aspect ratio
    //     ? 280
    //     : textWidth > 380 // iphone 13 pro aspect ratio
    //         ? 350
    //         : 350; // Default width if neither condition is met
    return ListView(
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
                  'assets/images/cats_.svg',
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
              // const SizedBox(height: 15),
              // SizedBox(
              //   width: width,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20),
              //     child: Text(
              //       'کەمترین کۆنمرە ببینە، زانیاری لەسەر بەشەکان ببینە، داهاتووی بەشەکت ببینە',
              //       style: TextStyle(
              //         color: ThemeColors.kLightGreyTextColor,
              //         fontSize: textWidth < 380
              //             ? 13
              //             : 14, //calculateTextFontSize(context) - 4
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
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
    );
  }
}
