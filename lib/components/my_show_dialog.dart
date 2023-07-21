import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constantes/them_colors.dart';

class ConnectionDialog extends StatelessWidget {
  final String string;

  const ConnectionDialog({required this.string, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoAlertDialog(
        title: const Text('Network Connection Required'),
        content: const Text('Please connect to a network and try again.'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: const Text('Network Connection Required'),
        content: Text(string),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(color: ThemeColors.kblueColor),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    }
  }
}
