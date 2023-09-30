import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyCupertinoAppBar({
    super.key,
    required this.enableLeading,
    required this.middleText,
  });

  final bool enableLeading;
  final String middleText;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: ThemeColors.kBodyColor,
      middle: Text(
        middleText,
        style: const TextStyle(color: ThemeColors.kBodyTextColor, fontSize: 18),
      ),
      border: null,
      leading: enableLeading
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                weight: 100,
                color: ThemeColors.kBodyTextColor,
              ),
            )
          : null,
      // automaticallyImplyLeading: true,
    );
  }
}
