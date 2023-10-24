import 'package:bashakam_barawzanko/Providers/theme_provider.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_list_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  int themeModeSelectedTileIndex = 0;

  @override
  Widget build(BuildContext context) {
    dynamic getIconColor(int index) {
      if (themeModeSelectedTileIndex == index) {
        return Theme.of(context).colorScheme.primary; // Selected tile
      } else {
        return Colors.transparent; // Unselected tiles
      }
    }

    Future<Color> saveCheckmark(
        int index, int themeModeSelectedTileIndex) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      if (themeModeSelectedTileIndex == index) {
        sharedPreferences.setBool('_show_check_$index', true);
        return Theme.of(context).colorScheme.primary;
      } else {
        sharedPreferences.setBool('_show_check_$index', false);
        return Colors.transparent;
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyCupertinoAppBar(
        enableLeading: true,
        middleText: 'دۆخی ڕووناکی',
      ),
      body: Column(
        children: [
          MyCupertinoListSection(
            headerText: 'دۆخی ڕووناکی',
            tiles: [
              MyCupertinoListTile(
                titleText: 'ڕووناک',
                onTap: (() {
                  setState(() {
                    final provider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    provider.setTheme(0);
                    themeModeSelectedTileIndex = 0;
                  });
                }),
                leadingIcon: CupertinoIcons.sun_min,
                trailing: Icon(
                  CupertinoIcons.check_mark,
                  color: getIconColor(0),
                ),
              ), // light theme

              MyCupertinoListTile(
                titleText: 'تاریک',
                onTap: (() {
                  setState(() {
                    final provider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    provider.setTheme(1);
                    themeModeSelectedTileIndex = 1;
                  });
                }),
                leadingIcon: CupertinoIcons.moon,
                trailing: Icon(
                  CupertinoIcons.check_mark,
                  color: getIconColor(1),
                ),
              ), // dark theme
              MyCupertinoListTile(
                titleText: 'بەپێی سیستەم',
                onTap: (() {
                  setState(() {
                    final provider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    provider.setTheme(2);
                    themeModeSelectedTileIndex = 2;
                  });
                }),
                leadingIcon: CupertinoIcons.gear,
                trailing: Icon(
                  CupertinoIcons.check_mark,
                  color: getIconColor(2),
                ),
              ), // system-based
            ],
          )
        ],
      ),
    );
  }
}

// class ThemeSwitcher extends StatefulWidget {
//   const ThemeSwitcher({super.key});

//   @override
//   State<ThemeSwitcher> createState() => _ThemeSwitcherState();
// }

// class _ThemeSwitcherState extends State<ThemeSwitcher> {
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Switch(
//       value: themeProvider.isDarkMode,
//       onChanged: ((value) {
//         final provider = Provider.of<ThemeProvider>(context, listen: false);
//         provider.toggleTheme(value);
//       }),
//     );
//   }
// }