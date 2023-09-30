import 'package:bashakam_barawzanko/components/my_appbar.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/material.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.kBodyColor,
      appBar: MyAppBar(text: 'دۆخی ڕووناکی'),
    );
  }
}
