// ignore_for_file: use_build_context_synchronously

import 'package:bashakam_barawzanko/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    Key? key,
    required this.title,
    required this.content,

    required this.firstActionDialogText,
    required this.firstActionOnTap,

    required this.enableFirstActionDialog,
    required this.enableSecondAcriotnDialog,
    this.secondActionDialogText,

    this.secondActionOnTap,
    this.iconData,
    required this.enableIcon,
  }) : super(key: key);
  final IconData? iconData;
  final String title;
  final String content;

  final String firstActionDialogText;
  final String? secondActionDialogText;

  final bool enableFirstActionDialog;
  final bool enableSecondAcriotnDialog;

  final Function() firstActionOnTap;
  final Function()? secondActionOnTap;

  final bool enableIcon;
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
            //! بەهۆی ڕتڵ لەخوارەوە بۆ سەرەوە ڕیزبەندی دەکرێ

            if (enableFirstActionDialog)
              CupertinoDialogAction(
                onPressed: firstActionOnTap,
                child: Text(
                  firstActionDialogText,
                  style: TextStyle(
                    color: CupertinoColors.systemBlue,
                    fontFamily: Constants.getFont(context) ==
                            Constants.sanFranciscoUITextBold
                        ? Constants.sanFranciscoUITextMedium
                        : Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    fontSize: 15,
                  ),
                ),
              ),
            if (enableSecondAcriotnDialog)
              CupertinoDialogAction(
                onPressed: secondActionOnTap,
                child: Text(
                  secondActionDialogText!,
                  style: TextStyle(
                    color: CupertinoColors.systemBlue,
                    fontFamily: Constants.getFont(context) ==
                            Constants.sanFranciscoUITextBold
                        ? Constants.sanFranciscoUITextMedium
                        : Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    fontSize: 15,
                  ),
                ),
              ),
            
          ],
        ),
      );
    } else {
      return AlertDialog(
        icon: enableIcon
            ? Icon(
                iconData,
                color: Theme.of(context).colorScheme.secondary,
              )
            : null,
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
            onPressed: secondActionOnTap,
            child: Text(
              secondActionDialogText!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                // fontSize: 14,
              ),
            ),
          ),
          //* close dialog button
          enableFirstActionDialog 
              ? TextButton(
                  onPressed: firstActionOnTap,
                  child: Text(
                    firstActionDialogText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      // fontSize: 14,
                    ),
                  ),
                )
              : Container(),
        ],
      );
    }
  }
}
