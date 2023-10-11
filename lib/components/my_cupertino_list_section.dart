import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/cupertino.dart';

class MyCupertinoListSection extends StatelessWidget {
  const MyCupertinoListSection({
    super.key,
    required this.headerText,
    required this.tiles,
  });

  final String headerText;

  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: const CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: ThemeColors.kblueColor,
        scaffoldBackgroundColor: ThemeColors.kBodyColor,
      ),
      child: CupertinoListSection.insetGrouped(
        backgroundColor: ThemeColors.kBodyColor,
        header: Text(
          headerText,
          style: const TextStyle(
              color: ThemeColors.kLightGreyTextColor,
              fontFamily: "rabarBold",
              fontWeight: FontWeight.w100,
              fontSize: 15),
        ),
        children: [
          ...tiles,
        ],
      ),
    );
  }
}

class MyCupertinoListTile extends StatelessWidget {
  const MyCupertinoListTile({
    super.key,
    required this.titleText,
    this.icon,
    required this.onTap,
    required this.trailing,
  });

  final String titleText;
  final IconData? icon;
  final void Function() onTap;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      backgroundColor: ThemeColors.kMyCardColor,
      title: Text(
        titleText,
        style: const TextStyle(
          fontFamily: 'rabarBold',
          fontSize: 15,
        ),
      ),
      leading: Icon(
        icon,
        size: 22,
        color: ThemeColors.kBodyTextColor,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
