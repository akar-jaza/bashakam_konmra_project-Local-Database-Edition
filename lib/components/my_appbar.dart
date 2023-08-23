import 'dart:io';

import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/cupertino.dart';
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
      iconTheme: const IconThemeData(color: ThemeColors.kBodyTextColor),
      backgroundColor: ThemeColors.kBodyColor,
      surfaceTintColor: ThemeColors.kblueColor,
      leading: Platform.isIOS
          ? Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CupertinoNavigationBarBackButton(
                color: ThemeColors.kBodyTextColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          : IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      titleSpacing: 0,
      title: Expanded(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: const TextStyle(color: ThemeColors.kBodyTextColor),
          ),
        ),
      ),
    );
  }
}
