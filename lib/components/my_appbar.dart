import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    required this.text,
    this.cupertinoIconData,
    this.materialIconData,
    super.key,
  });
  final String text;
  final IconData? cupertinoIconData;
  final IconData? materialIconData;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: ThemeColors.kBodyTextColor,
      ),
      backgroundColor: ThemeColors.kBodyColor,
      surfaceTintColor: ThemeColors.kblueColor,
      titleSpacing: 0,
      title: FittedBox(
        fit: BoxFit.scaleDown,
        // alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: const TextStyle(
              color: ThemeColors.kBodyTextColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
