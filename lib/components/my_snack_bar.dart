import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({
    super.key,
    required this.contentText,
  });
  final String contentText;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      showCloseIcon: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      closeIconColor: Theme.of(context).colorScheme.onInverseSurface,
      content: Text(
        contentText,
        style: TextStyle(color: Theme.of(context).colorScheme.onInverseSurface),
      ),
    );
  }
}