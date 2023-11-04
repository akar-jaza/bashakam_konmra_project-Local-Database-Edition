import 'package:bashakam_barawzanko/Providers/font_provider.dart';
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

  String getDeviceType() {
    final MediaQueryData data = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single);

    return data.size.shortestSide < 380 ? 'SE_size' : 'phone';
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final isIOS = platform == TargetPlatform.iOS;
    String getFont = FontProvider.defaultFont;

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
          color: Theme.of(context).colorScheme.surface,
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
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: getFont != "uniQaidar" ? 13 : 14,
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium?.fontFamily,
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
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily:
                            Theme.of(context).textTheme.bodyMedium?.fontFamily,
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
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: getFont != "uniQaidar" ? 14 : 15,
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.fontFamily,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
