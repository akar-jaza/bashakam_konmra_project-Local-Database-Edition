import 'dart:io';

import 'package:bashakam_barawzanko/Screens/Setting_screen/about_screen.dart';
import 'package:bashakam_barawzanko/Screens/Setting_screen/font_screen.dart';
import 'package:bashakam_barawzanko/Screens/Setting_screen/theme_screen.dart';
import 'package:bashakam_barawzanko/components/my_alert_dialog.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_list_section.dart';
import 'package:bashakam_barawzanko/util/launchers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share_plus/share_plus.dart';

class IOSHomePage extends StatefulWidget {
  const IOSHomePage({super.key});

  @override
  State<IOSHomePage> createState() => _IOSHomePageState();
}

class _IOSHomePageState extends State<IOSHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: Theme.of(context).brightness,
        scaffoldBackgroundColor: Theme.of(context).colorScheme.background,
      ),
      child: CupertinoPageScaffold(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            MyCupertinoListSection(
              headerText: 'ڕووکار',
              tiles: [
                MyCupertinoListTile(
                  titleText: 'دۆخی تاریک',
                  leadingIcon: CupertinoIcons.moon,
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return const ThemeScreen();
                    //     },
                    //   ),
                    // );
                  },
                  // trailing: const CupertinoListTileChevron(),
                  trailing: const ThemeSwitcher(),
                ),
                MyCupertinoListTile(
                  titleText: 'فۆنت',
                  leadingIcon: CupertinoIcons.textformat,
                  onTap: () {
                    if (Platform.isIOS) {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute<bool>(
                          fullscreenDialog: false,
                          builder: (BuildContext context) => const FontScreen(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const FontScreen();
                          },
                        ),
                      );
                    }
                  },
                  trailing: const CupertinoListTileChevron(),
                ),
              ],
            ),
            MyCupertinoListSection(
              headerText: 'دەربارە',
              tiles: [
                MyCupertinoListTile(
                  titleText: 'دەربارەی بەشەکەم',
                  leadingIcon: CupertinoIcons.info,
                  onTap: () {
                    if (Platform.isIOS) {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute<bool>(
                          fullscreenDialog: false,
                          builder: (BuildContext context) =>
                              const AboutScreen(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AboutScreen();
                          },
                        ),
                      );
                    }
                  },
                  trailing: const CupertinoListTileChevron(),
                ),
              ],
            ),
            MyCupertinoListSection(
              headerText: 'زیاتر',
              tiles: [
                MyCupertinoListTile(
                  titleText: 'پەیوەندی',
                  leadingIcon: CupertinoIcons.mail,
                  onTap: () {
                    launchEmailToDeveloper(context);
                  },
                  trailing: const CupertinoListTileChevron(),
                ),
                MyCupertinoListTile(
                  titleText: 'هەڵسەنگاندن',
                  leadingIcon: CupertinoIcons.star,
                  onTap: () {
                    try {
                      //todo change iOSAppID after publishing beta
                      LaunchReview.launch(
                        writeReview: false,
                        androidAppId: "com.akarfolio.bashakam_barawzanko",
                        iOSAppId: "9365832",
                      );
                    } catch (e) {
                      print(e);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return MyAlertDialog(
                              title:
                                  'سەرکەوتوو نەبوو لە کردنەوەی ئەپستۆر یاخود پلەیستۆر',
                              content:
                                  'کێشەیەک بوونی هەیە، تکایە دواتر هەوڵبدەرەوە یاخود پەیوەندی بە گەشەپێدەرەوە بکە',
                              firstActionDialogText: 'باشە',
                              firstActionOnTap: () {},
                              enableFirstActionDialog: false,
                              enableSecondAcriotnDialog: false,
                              enableIcon: false,
                            );
                          });
                    }
                  },
                  trailing: const CupertinoListTileChevron(),
                ),
                MyCupertinoListTile(
                  titleText: 'هاوبەشی بکە',
                  leadingIcon: CupertinoIcons.share,
                  onTap: () {
                    Share.share(
                        'check out my website https://example.com'); //todo change it bashakam domain
                  },
                  trailing: Container(),
                ),
                // Add more tiles as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// class SettingScreen extends StatelessWidget {
//   const SettingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isIOS) {
//       return const IOSHomePage();
//     }

//     // For Android or unsupported platforms, return the Android setting screen
//     return const AndroidSettingScreen();
//   }
// }

// class AndroidSettingScreen extends StatefulWidget {
//   const AndroidSettingScreen({super.key});

//   @override
//   State<AndroidSettingScreen> createState() => _AndroidSettingScreenState();
// }

// class _AndroidSettingScreenState extends State<AndroidSettingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final List<String> items = [
//       'بەپێی سیستەم',
//       'دۆخی ڕووناک',
//       'دۆخی تاریک',
//     ];
//     String? selectedItem = 'بەپێی سیستەم';

//     return Scaffold(
//       backgroundColor: ThemeColors.kBodyColor,
//       body: Padding(
//         padding: const EdgeInsets.all(18),
//         child: ListView(
//           children: [
//             const Text(
//               'ڕووکار',
//               style: TextStyle(
//                 color: ThemeColors.kblueColor,
//                 fontSize: 14,
//               ),
//             ),
//             const SizedBox(height: 25),
//             const Text(
//               'باری ڕووناکی',
//               style: TextStyle(
//                 color: ThemeColors.kBodyTextColor,
//                 fontSize: 16,
//               ),
//             ),
//             Theme(
//               data: Theme.of(context).copyWith(
//                 canvasColor: ThemeColors.kMyCardColor,
//               ),
//               child: DropdownButton<String>(
//                 value: selectedItem,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedItem = newValue;
//                   });
//                 },
//                 items: items.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(
//                       value,
//                       style: const TextStyle(
//                         color: ThemeColors.kLightGreyTextColor,
//                         fontSize: 14,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//                 iconSize: 25,
//                 iconEnabledColor: ThemeColors.kLightGreyTextColor,
//                 underline: const SizedBox(),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               'دەربارە',
//               style: TextStyle(
//                 color: ThemeColors.kblueColor,
//                 fontSize: 14,
//               ),
//             ),
//             const SizedBox(height: 25),
//             SettingCard(
//               title: 'دەربارەی بەشەکەم',
//               subTitle: 'من کێم و بۆچی ئەپڵیکەیشنی بەشەکەمم درووست کرد؟',
//               onTap: () {},
//             ),
//             const SizedBox(height: 44),
//             const Text(
//               'زیاتر',
//               style: TextStyle(
//                 color: ThemeColors.kblueColor,
//                 fontSize: 14,
//               ),
//             ),
//             const SizedBox(height: 25),
//             SettingCard(
//               title: 'پەیوەندی',
//               subTitle: 'پەیوەندی بە گەشەپێدەرەوە بکە ',
//               onTap: () {},
//             ),
//             const SizedBox(height: 25),
//             SettingCard(
//               title: 'هەڵسەنگاندن',
//               subTitle: 'هەڵسەنگاندنت بەرز دەنرخێنم 💙',
//               onTap: () {},
//             ),
//             const SizedBox(height: 25),
//             SettingCard(
//               title: 'هاوبەشی بکە',
//               subTitle: 'لەگەڵ هاوپۆل و هاوڕێکانت هاوبەشی پێبکە',
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
