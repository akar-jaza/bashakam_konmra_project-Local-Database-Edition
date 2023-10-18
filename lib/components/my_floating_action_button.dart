import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      onPressed: onPressed,
      child: Icon(
        Icons.info,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        size: 25,
      ),
    );
  }
}



/**
 * if (Platform.isIOS) {
      return SizedBox(
        width: 180.0,
        height: 55.0,
        child: CupertinoButton(
          onPressed: onPressed,
          color: Theme.of(context).colorScheme.onSecondary,
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(17),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.info_circle_fill,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'تکایە بمخوێنەرەوە',
                style: TextStyle(
                  fontFamily: "rabarBold",
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        onPressed: onPressed,
        icon: Icon(
          Icons.info,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        label: const Text('تکایە بمخوێنەرەوە'),
      );
    }
 */