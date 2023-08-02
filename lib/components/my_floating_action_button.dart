import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../constantes/them_colors.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return SizedBox(
        width: 185.0,
        height: 60.0,
        child: CupertinoButton(
          onPressed: onPressed,
          color: ThemeColors.kBoldBlueTextColor,
          padding: EdgeInsets.zero,
          // borderRadius: BorderRadius.circular(20),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.info_circle_fill,
                color: ThemeColors.kblueColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'تکایە بمخوێنەرەوە',
                style: TextStyle(
                  fontFamily: "rabarBold",
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return FloatingActionButton.extended(
        backgroundColor: ThemeColors.kBoldBlueTextColor,
        onPressed: onPressed,
        icon: const Icon(
          Icons.info,
          color: ThemeColors.kblueColor,
        ),
        label: const Text('تکایە بمخوێنەرەوە'),
      );
    }
  }
}
