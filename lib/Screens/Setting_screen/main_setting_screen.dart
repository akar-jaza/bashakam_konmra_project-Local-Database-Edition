import 'dart:io';

import 'package:bashakam_barawzanko/Screens/Setting_screen/theme_screen.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_list_section.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        brightness: ThemeProvider().getSelectedTheme == ThemeMode.dark
            ? Brightness.dark
            : Brightness.light,
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
                  titleText: 'دۆخی ڕووناکی',
                  icon: CupertinoIcons.paintbrush,
                  onTap: () => Platform.isIOS
                      ? Navigator.of(context, rootNavigator: true).push(
                          CupertinoPageRoute<bool>(
                            fullscreenDialog: false,
                            builder: (BuildContext context) =>
                                const ThemeScreen(),
                          ),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const ThemeScreen();
                            },
                          ),
                        ),
                  trailing: ,
                ),
                MyCupertinoListTile(
                  titleText: 'فۆنت',
                  icon: CupertinoIcons.textformat,
                  onTap: () {},
                  trailing: const CupertinoListTileChevron(),
                ),
              ],
            ),
            MyCupertinoListSection(
              headerText: 'دەربارە',
              tiles: [
                MyCupertinoListTile(
                  titleText: 'دەربارەی بەشەکەم',
                  icon: CupertinoIcons.info,
                  onTap: () {},
                  trailing: const CupertinoListTileChevron(),
                ),
              ],
            ),
            MyCupertinoListSection(
              headerText: 'زیاتر',
              tiles: [
                MyCupertinoListTile(
                  titleText: 'پەیوەندی',
                  icon: CupertinoIcons.mail,
                  onTap: () {},
                  trailing: const CupertinoListTileChevron(),
                ),
                MyCupertinoListTile(
                  titleText: 'هەڵسەنگاندن',
                  icon: CupertinoIcons.star,
                  onTap: () {},
                  trailing: const CupertinoListTileChevron(),
                ),
                MyCupertinoListTile(
                  titleText: 'هاوبەشی بکە',
                  icon: CupertinoIcons.share,
                  onTap: () {},
                  trailing: const CupertinoListTileChevron(),
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
