import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constantes/them_colors.dart';
import 'dart:io';

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    required TextEditingController textController,
    required this.labelText,
    required this.onPressed,
    required this.onChanged,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;
  final String labelText;
  final void Function()? onPressed;
  final void Function(String)? onChanged;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      keyboardType: TextInputType.text,
      controller: widget._textController,
      cursorColor: ThemeColors.kblueColor,
      style: const TextStyle(
        color: ThemeColors.kBodyTextColor,
        fontFamily: 'rabarBold',
        fontSize: 14,
        letterSpacing: 0.0,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: Platform.isIOS
            ? const SizedBox(
                height: 24,
                child: Icon(
                  CupertinoIcons.search,
                  size: 20,
                  color: ThemeColors
                      .kBodyTextColor,
                ),
              )
            : const Icon(
                Icons.search,
                color: ThemeColors.kBodyTextColor,
              ),
        labelStyle: const TextStyle(
          color: ThemeColors.kLightGreyTextColor,
          fontSize: 14,
        ),
        hintStyle: const TextStyle(
          color: ThemeColors.kLightGreyTextColor,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColors.kLightGreyTextColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColors.kLightGreyTextColor,
          ),
        ),
        fillColor: ThemeColors.kMyCardColor,
        filled: true,
      ),
      enableInteractiveSelection: true,

      // textDirection: TextDirection.rtl,
      // textAlign: TextAlign.right,
    );
  }
}
