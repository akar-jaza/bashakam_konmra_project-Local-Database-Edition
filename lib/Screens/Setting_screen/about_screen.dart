// ignore_for_file: prefer_const_constructors

import 'package:bashakam_barawzanko/components/about_section_container_widget.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:bashakam_barawzanko/util/asynchronous_ui_update.dart';
import 'package:bashakam_barawzanko/util/launchers.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  AsynchronousUIUpdate asynchronousUIUpdate = AsynchronousUIUpdate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar:const MyCupertinoAppBar( 
        enableLeading: true,
        middleText: 'دەربارەی بەشەکەم',
      ),
      body: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            AboutSectionContainer(
              showIcons: false,
              isBodyTextCenter: false,
              titleText: bashakamTitleText,
              bodyText: bashakamBodyText,
              assetImage: 'assets/images/MaterialIcon.png',
              dottedBorderColor: Theme.of(context).colorScheme.primary,
              circleAvatarBackgroundColor: Color(0xffCEE5FF),
              iconButtons: [Container()], // no icon button
            ),
            AboutSectionContainer(
              showIcons: true,
              isBodyTextCenter: true,
              titleText: portfolioTitle,
              bodyText: portfolioBody,
              assetImage: 'assets/images/memoji.png',
              dottedBorderColor: Theme.of(context).colorScheme.primary,
              circleAvatarBackgroundColor:
                  Theme.of(context).colorScheme.primary,
              iconButtons: [
                TextButton(
                  onPressed: () {
                    launchEmailToDeveloper(context);
                  },
                  child: asynchronousUIUpdate.asyncMailIconUpdate(),
                ),
                TextButton(
                  onPressed: () {
                    launchlinkdedInURL(context);
                  },
                  child: asynchronousUIUpdate.asyncLinkdinIconUpdate(),
                ),
                TextButton(
                  onPressed: () {
                    launchGitHubURL(context);
                  },
                  child: asynchronousUIUpdate.asyncGitHubIconUpdate(),
                ),
                TextButton(
                  onPressed: () {
                    launchFacebookURL(context);
                  },
                  child: asynchronousUIUpdate.asyncFacebookIconUpdate(),
                ),
              ],
            ),
            AboutSectionContainer(
              showIcons: true,
              isBodyTextCenter: true,
              titleText: vevanTitle,
              bodyText: vevanBody,
              assetImage: 'assets/images/eng_vege.png',
              dottedBorderColor: Theme.of(context).colorScheme.scrim,
              circleAvatarBackgroundColor: Theme.of(context).colorScheme.scrim,
              iconButtons: [
                TextButton(
                  onPressed: () {
                    launchlTelegramURL(context);
                  },
                  child: asynchronousUIUpdate.asyncTelegramIconUpdate(),
                ),
                TextButton(
                  onPressed: () {
                    launchlInstagramURL(context);
                  },
                  child: asynchronousUIUpdate.asyncInstagramIconUpdate(),
                ),
              ],
            ),
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

  final String vevanTitle = "ئەندازیار ڤیڤان تریفە";
  final String vevanBody =
      "سووپاس بۆ ئەندازیار ڤیڤان تریفە، کە یارمەتیدەرم بووە لە پێدانی تەواوی کۆنمرەی بەشەکان و گەلێ شتی تر. ";
}


