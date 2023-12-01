import 'package:bashakam_barawzanko/Providers/font_provider.dart';
import 'package:bashakam_barawzanko/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyCupertinoAppBar({
    super.key,
    required this.enableLeading,
    required this.middleText,
    this.isMiddleTextBlue,
    this.trailing,
  });

  final bool enableLeading;

  final String middleText;
  final bool? isMiddleTextBlue;
  final Widget? trailing;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    String getFont = FontProvider.defaultFont;

    final textColor = isMiddleTextBlue == true
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onBackground;
    return CupertinoNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        middle: Text(
          middleText,
          style: TextStyle(
            color: textColor,
            fontSize: Constants.appBarFontSize(getFont),
          ),
        ),
        border: null,
        leading: enableLeading
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 19,
                  weight: 100,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              )
            : null,
        trailing: trailing);
  }
}


/** appBar: Platform.isIOS
          ? MyCupertinoAppBar(
              enableLeading: false,
              middleText: '${_appBarTitles[selectedIndex]}',
            )
          : AppBar(title: MyAppBar(text: '${_appBarTitles[selectedIndex]}')), */

          