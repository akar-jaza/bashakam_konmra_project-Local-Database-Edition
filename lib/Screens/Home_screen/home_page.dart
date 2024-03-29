import 'dart:io';
import 'package:bashakam_barawzanko/Providers/font_provider.dart';
import 'package:bashakam_barawzanko/Screens/department_introduction/department_introduction_screen.dart';
import 'package:bashakam_barawzanko/Screens/kamtrin_konmra/kamtrin_konmra_page.dart';
import 'package:bashakam_barawzanko/components/my_alert_dialog.dart';
import 'package:bashakam_barawzanko/components/my_card.dart';
import 'package:bashakam_barawzanko/constants/constants.dart';
import 'package:bashakam_barawzanko/util/asynchronous_ui_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String imageLightThemeAsset = 'assets/images/cats_.svg';
    String imageDarkThemeAsset = 'assets/images/cats_darkMode.svg';
    String getFont = Provider.of<FontProvider>(context, listen: true).getFont;

    AsynchronousUIUpdate asynchronousUIUpdate = AsynchronousUIUpdate();

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: 25,
        ),
        asynchronousUIUpdate.asyncHomePageImageUpdate(
          imageLightThemeAsset,
          imageDarkThemeAsset,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'لەگەڵ بەشەکەم، زانیاری لەسەر بەشەکەت ببینە',
            style: TextStyle(
              fontSize: Constants.setHomePageTitleTextFontSize(getFont),
              color: Theme.of(context).colorScheme.onBackground,
              fontFamily:
                  Provider.of<FontProvider>(context, listen: true).getFont,
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
              imageAsset: SvgPicture.asset(
                'assets/images/list3.svg',
                height: 50,
              ),
              buttonTitle: 'ببینە',
              color: Theme.of(context).colorScheme.onPrimary,
              text: 'کەمترین کۆنمرە',
              onTap: () {
                if (Platform.isIOS) {
                  Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) => const KamtrinKonmra(),
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
              imageAsset: SvgPicture.asset(
                'assets/images/cap2.svg',
                height: 50,
              ),
              buttonTitle: 'ببینە',
              color: Theme.of(context).colorScheme.onTertiary,
              text: 'بەشەکان',
              onTap: () {
                if (Platform.isIOS) {
                  Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) =>
                          const DepartmentIntroductionScreenTemp(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DepartmentIntroductionScreenTemp();
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCard(
              imageAsset:
                  asynchronousUIUpdate.asyncHomePageReordarableIconUpdate(),
              buttonTitle: 'ببینە',
              color: Theme.of(context).colorScheme.onPrimary,
              text: 'ڕیزبەندیەکانم',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return MyAlertDialog(
                      title: 'بەمزووانە ⭐️',
                      content: 'لە داهاتوویەکی نزیک ✨',
                      firstActionDialogText: 'باشە',
                      firstActionOnTap: () => Navigator.pop(context),
                      enableFirstActionDialog: true,
                      enableSecondAcriotnDialog: false,
                      enableIcon: false,
                    );
                  },
                );
              },
            ),
            MyCard(
              imageAsset: asynchronousUIUpdate.asyncHomePageCollegeIconUpdate(),
              buttonTitle: 'ببینە',
              color: Theme.of(context).colorScheme.onPrimary,
              text: 'زانکۆکان',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return MyAlertDialog(
                      title: 'بەمزووانە ⭐️',
                      content: 'لە داهاتوویەکی نزیک ✨',
                      firstActionDialogText: 'باشە',
                      firstActionOnTap: () => Navigator.pop(context),
                      enableFirstActionDialog: true,
                      enableSecondAcriotnDialog: false,
                      enableIcon: false,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
