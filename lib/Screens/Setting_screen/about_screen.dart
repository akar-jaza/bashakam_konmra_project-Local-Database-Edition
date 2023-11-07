// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:bashakam_barawzanko/color/theme_colors.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:bashakam_barawzanko/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyCupertinoAppBar(
        enableLeading: true,
        middleText: 'دەربارەی بەشەکەم',
      ),
      body: Center(
        child: ListView(
          children: [
            AboutSectionContainer(
              showIcons: false,
              isBodyTextCenter: false,
              titleText: bashakamTitleText,
              bodyText: bashakamBodyText,
              assetImage: 'assets/images/MaterialIcon.png',
              dottedBorderColor: Theme.of(context).colorScheme.primary,
            ),
            AboutSectionContainer(
              showIcons: true,
              isBodyTextCenter: true,
              titleText: portfolioTitle,
              bodyText: portfolioBody,
              assetImage: 'assets/images/facebook_pic.jpeg',
              dottedBorderColor: Theme.of(context).colorScheme.tertiary,
            ),
            AboutSectionContainer(
                showIcons: true,
                isBodyTextCenter: true,
                titleText: portfolioTitle,
                bodyText: portfolioBody,
                assetImage: 'assets/images/eng_vege.png',
                dottedBorderColor: ThemeColors.kYellowColor),
          ],
        ),
      ),
    );
  }

  final String bashakamTitleText = '"بەشەکەم"';
  final String bashakamBodyText =
      "وەک دەرچوویەکی پۆلی ١٢، هەمیشە هەستم بەوە کردووە کە خوێندکاری پۆلی ١٢ چەند پێویستیان بە یارمەتیە، چەند پێویستیان بەوەیە کەسێک بارێکی سەر شانیان کەم بکاتەوە. من وەک گەشەپێدەرێک هەر لە سەرەتای چوونم بۆ بەشی ئایتی، بیرم لەوە کردۆتەوە ئەپڵیکەیشنێک درووست بکەم سادەبێت، ڕووکاری جوان بێت، خێرا بێت، تایبەت بە خوێندکارانی پۆلی دوانزە، کە بتوانێت زانیاری لەسەر بەشی دڵخوازی بدۆزێتەوە. سووپاس بۆ پەروەرێن، کە کاری بۆ ئاسان کردم و ڕێگەی بۆ کردمەوە تاوەکو ئەپڵیکەیشنێک درووست بکەم بۆ تۆی خوێندکار، کە بتوانیت سوودی لێ ببینیت.\n\n ئامانج لەم ئەپلیکەیشنە یارمەتیدانی خوێندکارانی پۆلی و دوانزەیە و بەتەواوی بە خۆڕاییە.";

  final String portfolioTitle = 'من کێم؟';
  final String portfolioBody =
      "من 'ئاکار جزا' گەشەپێدەری ئەپڵیکەیشنم، خوێندکاری تەکنەلۆجیای زانیاریم لە کۆلێژی تەکنیکی ئینفۆرکاتیک.";
}

class AboutSectionContainer extends StatelessWidget {
  const AboutSectionContainer({
    super.key,
    required this.bodyText,
    required this.titleText,
    required this.assetImage,
    required this.dottedBorderColor,
    this.rowsOfIcons,
    required this.showIcons,
    required this.isBodyTextCenter,
  });

  final String bodyText;
  final String titleText;
  final String assetImage;
  final Color dottedBorderColor;
  final Widget? rowsOfIcons;
  final bool showIcons;
  final bool isBodyTextCenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Container(
            width: Constants.getScreenWidth(context) * 0.876,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  DottedBorder(
                    dashPattern: const [9, 7],
                    borderType: BorderType.Circle,
                    color: dottedBorderColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(assetImage),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      titleText,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    bodyText,
                    textAlign:
                        isBodyTextCenter ? TextAlign.center : TextAlign.start,
                  ),
                  showIcons
                      ? RowsOfIcons(
                          icons: [
                            TextButton(
                              onPressed: () {},
                              child: Image.asset(
                                "assets/images/social_icons/arroba_dark_mode.png",
                                height: 25,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Image.asset(
                                "assets/images/social_icons/linkedin_dark_mode.png",
                                height: 25,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Image.asset(
                                "assets/images/social_icons/github_dark_mode.png",
                                height: 25,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Image.asset(
                                "assets/images/social_icons/facebook_dark_mode.png",
                                height: 25,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class RowsOfIcons extends StatefulWidget {
  const RowsOfIcons({
    super.key,
    required this.icons,
  });
  final List<Widget> icons;

  @override
  State<RowsOfIcons> createState() => _RowsOfIconsState();
}

class _RowsOfIconsState extends State<RowsOfIcons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.icons,
      ),
    );
  }
}
