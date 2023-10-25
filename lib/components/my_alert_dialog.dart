import 'package:bashakam_barawzanko/Providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.firstActionDialogText,
    this.firstActionOnTap,
    this.iconData,
  }) : super(key: key);
  final IconData? iconData;
  final String title;
  final String content;
  final String firstActionDialogText;
  final Function()? firstActionOnTap;
  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoTheme(
        data: CupertinoThemeData(
          barBackgroundColor:
              ThemeProvider().isDarkMode ? CupertinoColors.black : Colors.white,
        ),
        child: CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: ThemeProvider().isDarkMode
                  ? CupertinoColors.white
                  : Colors.black,
            ),
          ),
          content: Text(
            content,
            style: TextStyle(
              color: ThemeProvider().isDarkMode
                  ? CupertinoColors.white
                  : Colors.black,
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: firstActionOnTap,
              child: Text(
                firstActionDialogText,
                style: const TextStyle(color: CupertinoColors.systemBlue),
              ),
            ),
          ],
        ),
      );
    } else {
      return AlertDialog(
        icon: Icon(
          iconData,
          color: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 20,
          ),
        ),
        content: Text(
          content,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 14,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: firstActionOnTap,
            child: Text(
              firstActionDialogText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                // fontSize: 14,
              ),
            ),
          ),
        ],
      );
    }
  }
}
