import 'package:flutter/material.dart';

SnackBar mySnackBar(
    {required BuildContext context, required String titleText}) {
  return SnackBar(
    content: Text(
      titleText,
      style: const TextStyle(
        fontSize: 16,
      ),
    ),
    duration: const Duration(seconds: 5),
    showCloseIcon: true,
  );
}
