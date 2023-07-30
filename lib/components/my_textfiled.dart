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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        onChanged: widget.onChanged,
        keyboardType: TextInputType.text,
        controller: widget._textController,
        cursorColor: ThemeColors.kblueColor,
        style: const TextStyle(
          color: ThemeColors.kWhiteTextColor,
          fontFamily: 'Roboto',
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: Platform.isIOS
              ? const SizedBox(
                  height: 24, // Set the desired height for the button
                  child: Icon(
                    CupertinoIcons.search,
                    size: 20,
                    color: ThemeColors
                        .kWhiteTextColor, // Set the desired size for the icon
                  ),
                )
              : const Icon(
                  Icons.search,
                  color: ThemeColors.kWhiteTextColor,
                ),
          labelStyle: const TextStyle(
            color: ThemeColors.kGreyTextColor,
            fontSize: 14,
          ),
          hintStyle: const TextStyle(
            color: ThemeColors.kGreyTextColor,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.kGreyTextColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.kGreyTextColor,
            ),
          ),
          fillColor: ThemeColors.kMyCardColor,
          filled: true,
        ),
        enableInteractiveSelection: true,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
      ),
    );
  }
}
