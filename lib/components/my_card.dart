import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    this.verticalMargin,
    required this.imageAsset,
    required this.buttonTitle,
    required this.color,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final double? verticalMargin;
  final String imageAsset;
  final String buttonTitle;
  final Color color;
  final String text;
  final Function()? onTap;

  // double calculateTextFontSize(BuildContext context) {
  //   final screenSize = MediaQuery.of(context).size;
  //   final screenWidth = screenSize.width;

  //   // Adjust the font size based on screenWidth
  //   if (screenWidth < 400) {
  //     return 11; // Small screen
  //   } else if (screenWidth < 600) {
  //     return 13; // Medium screen
  //   } else {
  //     return 15; // Large screen
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final isIOS = platform == TargetPlatform.iOS;

    double cardHeight = isIOS ? 174 : 163;
    double cardWidth = isIOS ? 145 : 135;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ThemeColors.kMyCardColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  text,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: ThemeColors.kBodyTextColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SvgPicture.asset(
              imageAsset,
              height: 50,
            ),
            const SizedBox(height: 10),
            isIOS
                ? CupertinoButton(
                    onPressed: onTap,
                    child: Text(
                      buttonTitle,
                      style: const TextStyle(
                        color: ThemeColors.kblueColor,
                        fontFamily: 'rabarBold',
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: onTap,
                    // borderRadius: BorderRadius.circular(6),
                    child: TextButton(
                      onPressed: onTap,
                      child: Text(
                        buttonTitle,
                        style: const TextStyle(color: ThemeColors.kblueColor),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
