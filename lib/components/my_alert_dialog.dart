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
          brightness: Theme.of(context).brightness,
        ),
        child: CupertinoAlertDialog(
          title: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium?.fontFamily,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 7,
              )
            ],
          ),
          content: Text(
            content,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
              fontSize: 11.5,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: firstActionOnTap,
              child: Text(
                firstActionDialogText,
                style: TextStyle(
                  color: CupertinoColors.systemBlue,
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium?.fontFamily,
                  fontSize: 15,
                ),
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
            // fontSize: 20,
          ),
        ),
        content: Text(
          content,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            // fontSize: 14,
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
