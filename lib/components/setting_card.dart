import 'dart:io';

import 'package:flutter/material.dart';

import '../constantes/theme_colors.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    required this.title,
    required this.subTitle,
    required this.onTap,
    super.key,
  });
  final String title;
  final String subTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStatePropertyAll(
        ThemeColors.kblueColor.withOpacity(0.2),
      ),
      highlightColor: Platform.isIOS
          ? Colors.transparent
          : ThemeColors.kblueColor.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: ThemeColors.kBodyTextColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subTitle,
            style: const TextStyle(
              color: ThemeColors.kLightGreyTextColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
