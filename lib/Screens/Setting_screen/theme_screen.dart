import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch(
      value: themeProvider.isDarkMode,
      onChanged: ((value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      }),
    );
  }
}


// class ThemeScreen extends StatefulWidget {
//   const ThemeScreen({super.key});

//   @override
//   State<ThemeScreen> createState() => _ThemeScreenState();
// }

// class _ThemeScreenState extends State<ThemeScreen> {
//   // ignore: unused_field
//   static int themeModeSelectedTileIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       appBar: const MyCupertinoAppBar(
//         enableLeading: true,
//         middleText: 'دۆخی ڕووناکی',
//       ),
//       body: Column(
//         children: [
//           MyCupertinoListSection(
//             headerText: 'دۆخی ڕووناکی',
//             tiles: [
//               buildListTile(
//                 'ڕووناک',
//                 CupertinoIcons.sun_min,
//                 0,
//                 themeProvider,
//               ), // light theme
//               buildListTile(
//                 'تاریک',
//                 CupertinoIcons.moon,
//                 1,
//                 themeProvider,
//               ), // dark theme
//               buildListTile(
//                 'بەپێی سیستەم',
//                 CupertinoIcons.gear,
//                 2,
//                 themeProvider,
//               ), // system-based
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   MyCupertinoListTile buildListTile(
//       String title, IconData icon, int index, ThemeProvider themeProvider) {
//     return MyCupertinoListTile(
//       titleText: title,
//       icon: icon,
//       onTap: () {
//         setState(() {
//           // themeModeSelectedTileIndex = index;
//           final provider = Provider.of<ThemeProvider>(context, listen: false);
//           provider.setTheme(index);
          
//         });
//       },
//       trailing: Icon(
//         CupertinoIcons.check_mark,
//         color: themeProvider.getSelectedTheme == getThemeDataForIndex(index)
//             ? Theme.of(context).colorScheme.primary
//             : Colors.transparent,
//       ),
//     );
//   }

//   ThemeMode getThemeDataForIndex(int index) {
//     switch (index) {
//       case 0:
//         return ThemeMode.light;
//       case 1:
//         return ThemeMode.dark;
//       case 2:
//         return ThemeMode.system;
//       default:
//         return ThemeMode.light;
//     }
//   }
// }


// class ThemeScreen extends StatefulWidget {
//   const ThemeScreen({super.key});

//   @override
//   State<ThemeScreen> createState() => _ThemeScreenState();
// }

// class _ThemeScreenState extends State<ThemeScreen> {
//   // ignore: unused_field
//   static int themeModeSelectedTileIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       appBar: const MyCupertinoAppBar(
//         enableLeading: true,
//         middleText: 'دۆخی ڕووناکی',
//       ),
//       body: Column(
//         children: [
//           MyCupertinoListSection(
//             headerText: 'دۆخی ڕووناکی',
//             tiles: [
//               buildListTile(
//                 'ڕووناک',
//                 CupertinoIcons.sun_min,
//                 0,
//                 themeProvider,
//               ), // light theme
//               buildListTile(
//                 'تاریک',
//                 CupertinoIcons.moon,
//                 1,
//                 themeProvider,
//               ), // dark theme
//               buildListTile(
//                 'بەپێی سیستەم',
//                 CupertinoIcons.gear,
//                 2,
//                 themeProvider,
//               ), // system-based
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   MyCupertinoListTile buildListTile(
//       String title, IconData icon, int index, ThemeProvider themeProvider) {
//     return MyCupertinoListTile(
//       titleText: title,
//       icon: icon,
//       onTap: () {
//         setState(() {
//           // themeModeSelectedTileIndex = index;
//           final provider = Provider.of<ThemeProvider>(context, listen: false);
//           provider.setTheme(index);
          
//         });
//       },
//       trailing: Icon(
//         CupertinoIcons.check_mark,
//         color: themeProvider.getSelectedTheme == getThemeDataForIndex(index)
//             ? Theme.of(context).colorScheme.primary
//             : Colors.transparent,
//       ),
//     );
//   }

//   ThemeMode getThemeDataForIndex(int index) {
//     switch (index) {
//       case 0:
//         return ThemeMode.light;
//       case 1:
//         return ThemeMode.dark;
//       case 2:
//         return ThemeMode.system;
//       default:
//         return ThemeMode.light;
//     }
//   }
// }
