import 'package:bashakam_barawzanko/constants/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AboutSectionContainer extends StatelessWidget {
  const AboutSectionContainer({
    super.key,
    required this.bodyText,
    required this.titleText,
    required this.assetImage,
    required this.dottedBorderColor,
    required this.showIcons,
    required this.isBodyTextCenter,
    required this.iconButtons,
    required this.circleAvatarBackgroundColor,
  });

  final String bodyText;
  final String titleText;
  final String assetImage;
  final Color dottedBorderColor;
  final bool showIcons;
  final bool isBodyTextCenter;
  final List<Widget> iconButtons;
  final Color circleAvatarBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Container(
            width: Constants.getScreenWidth(context) * 0.876,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  DottedBorder(
                    dashPattern: const [9, 7],
                    borderType: BorderType.Circle,
                    color: dottedBorderColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        backgroundColor: circleAvatarBackgroundColor,
                        radius:
                            Constants.getDeviceType() == Constants.tabletSize
                                ? 30
                                : 25,
                        backgroundImage: AssetImage(assetImage),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      titleText,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: _getTitleTextSize(),
                      ),
                    ),
                  ),
                  Text(
                    bodyText,
                    textAlign:
                        isBodyTextCenter ? TextAlign.center : TextAlign.start,
                    style: TextStyle(
                      fontSize: _getBodyTextSize(context),
                      fontFamily: Constants.getFont(context) ==
                              Constants.sanFranciscoUITextBold
                          ? Constants.sanFranciscoUITextMedium
                          : null,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  showIcons
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: iconButtons,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  double _getTitleTextSize() {
    if (Constants.getDeviceType() == Constants.tabletSize) {
      return 20;
    } else {
      return 18;
    }
  }

  double _getBodyTextSize(BuildContext context) {
    if (Constants.getDeviceType() == Constants.tabletSize) {
      return 16;
    } else if (Constants.getFont(context) == Constants.uniQaidar) {
      return 15;
    } else {
      return 14;
    }
  }
}