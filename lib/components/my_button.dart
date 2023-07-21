import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: FilledButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ThemeColors.kblueColor),
            foregroundColor:
                MaterialStateProperty.all(ThemeColors.kBoldBlueTextColor)),
        onPressed: widget.onPressed,
        child: const Text(
          'تۆمار بکە',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
