import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_list_section.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  int selectedTileIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.kBodyColor,
      appBar: const MyCupertinoAppBar(
        enableLeading: true,
        middleText: 'دۆخی ڕووناکی',
      ),
      body: Column(
        children: [
          MyCupertinoListSection(
            headerText: 'دۆخی ڕووناکی',
            tiles: [
              buildListTile('ڕووناک', CupertinoIcons.sun_min, 0), // light theme 
              buildListTile('تاریک', CupertinoIcons.moon, 1), // dark theme
              buildListTile('بەپێی سیستەم', CupertinoIcons.gear, 2), // system-based
            ],
          )
        ],
      ),
    );
  }

  MyCupertinoListTile buildListTile(String title, IconData icon, int index) {
    return MyCupertinoListTile(
      titleText: title,
      icon: icon,
      onTap: () {
        setState(() {
          selectedTileIndex = index;
        });
      },
      trailing: Icon(
        CupertinoIcons.check_mark,
        color: selectedTileIndex == index
            ? ThemeColors.kblueColor
            : Colors.transparent,
      ),
    );
  }
}
