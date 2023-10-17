import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    this.suffixIcon,
    this.isTextFieldActive,
    required TextEditingController textController,
    required this.labelText,
    required this.onPressed,
    required this.onChanged,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;
  final String labelText;
  final Widget? suffixIcon;
  final void Function()? onPressed;
  final void Function(String)? onChanged;
  final bool? isTextFieldActive;

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
      cursorColor: Theme.of(context).colorScheme.primary,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
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
                  icon: Icon(
                    Icons.clear,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                )
              : Platform.isIOS
                  ? Icon(
                      CupertinoIcons.search,
                      size: 20,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    )
                  : Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
        ),
        suffixIcon: widget.suffixIcon,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 14,
        ),
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 14,
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 15, horizontal: 10), // Adjust padding here
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
      ),
      enableInteractiveSelection: true,
    );
  }
}
