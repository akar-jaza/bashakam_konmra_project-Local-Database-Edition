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
      iconTheme: const IconThemeData(color: ThemeColors.kWhiteTextColor),
      backgroundColor: ThemeColors.kBodyColor,
      surfaceTintColor: ThemeColors.kblueColor,
      leading: Platform.isIOS
          ? CupertinoNavigationBarBackButton(
              color: ThemeColors.kWhiteTextColor,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                text,
                style: const TextStyle(color: ThemeColors.kWhiteTextColor),
              ),
            ),
          ),
          Platform.isIOS
              ? CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    cupertinoIconData,
                    color: ThemeColors.kblueColor,
                  ),
                )
              : IconButton(
                  icon: Icon(
                    materialIconData,
                    color: ThemeColors.kblueColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
        ],
      ),
    );
  }
}
