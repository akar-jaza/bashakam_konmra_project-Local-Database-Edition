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
  bool isTextFieldActive = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          isTextFieldActive = value.isNotEmpty;
        });
        widget.onChanged?.call(value); // Call the onChanged callback
      },
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
        prefixIcon: AnimatedSwitcher(
          switchInCurve: Curves.linearToEaseOut,
          switchOutCurve: Curves.linearToEaseOut,
          duration: const Duration(milliseconds: 200),
          child: isTextFieldActive
              ? IconButton(
                  onPressed: () {
                    widget._textController.clear();
                    setState(() {
                      isTextFieldActive = false;
                    });
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: ThemeColors.kBodyTextColor,
                  ),
                )
              : Platform.isIOS
                  ? const Icon(
                      CupertinoIcons.search,
                      size: 20,
                      color: ThemeColors.kBodyTextColor,
                    )
                  : const Icon(
                      Icons.search,
                      color: ThemeColors.kBodyTextColor,
                    ),
        ),
        suffixIcon: Platform.isIOS
            ? CupertinoButton(
                onPressed: widget.onPressed,
                child: const Icon(
                  CupertinoIcons.slider_horizontal_3,
                  color: ThemeColors.kBodyTextColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: IconButton(
                  onPressed: widget.onPressed,
                  icon: const Icon(
                    Icons.tune_outlined,
                    size: 26,
                    color: ThemeColors.kBodyTextColor,
                  ),
                ),
              ),
        labelStyle: const TextStyle(
          color: ThemeColors.kLightGreyTextColor,
          fontSize: 14,
        ),
        hintStyle: const TextStyle(
          color: ThemeColors.kLightGreyTextColor,
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 15, horizontal: 10), // Adjust padding here
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
    );
  }
}
