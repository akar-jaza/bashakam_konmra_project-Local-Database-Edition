import 'package:bashakam_barawzanko/Providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Constants {
  static const String seSize = "se_size";
  static const String iphoneProSize = "iphone11Pro";
  static const String iphoneProMaxSize = "iphone11ProMax";
  static const String tabletSize = "tabletSize";

  static const String rabarBold = "rabarBold";
  static const String sanFranciscoUITextRegular = "sanFranciscoUITextRegular";
  static const String sanFranciscoUITextBold = "sanFranciscoUITextBold";
  static const String sanFranciscoUITextHeavy = "sanFranciscoUITextHeavy";
  static const String sanFranciscoUITextMedium = "sanFranciscoUITextMedium";
  static const String uniQaidar = "uniQaidar";

  static String getDeviceType() {
    final MediaQueryData data = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single);
    if (data.size.shortestSide < 380) {
      return seSize;
    } else if (data.size.shortestSide < 429) {
      return iphoneProSize;
    } else if (data.size.shortestSide < 600) {
      return iphoneProMaxSize; 
    } else {
      return tabletSize;
    }  
  }

  static double setHomePageTitleTextFontSize(String getFont) {
    if (getFont == uniQaidar && getDeviceType() == iphoneProSize) {
      return 18; // 18
    } else if (getFont == uniQaidar && getDeviceType() == iphoneProMaxSize) {
      return 19; // 19
    } else if (getDeviceType() == iphoneProSize) {
      return 17;
    } else if (getDeviceType() == iphoneProMaxSize) {
      return 17;
    }
    return 17;
  }

  static double kamtrinKonmraTitleFontSize(String getFont) {
    if (getFont == uniQaidar && getDeviceType() == iphoneProSize) {
      return 19; // 18
    } else if (getFont == uniQaidar && getDeviceType() == iphoneProMaxSize) {
      return 20; // 19
    } else if (getDeviceType() == iphoneProSize) {
      return 18;
    } else if (getDeviceType() == iphoneProMaxSize) {
      return 19;
    }
    return 18;
  }

  static double departmentTitleFontSize(String getFont) {
    if (getFont == uniQaidar && getDeviceType() == iphoneProSize) {
      return 17; // 18
    } else if (getFont == uniQaidar && getDeviceType() == iphoneProMaxSize) {
      return 17; // 19
    } else if (getDeviceType() == iphoneProSize) {
      return 14.5;
    } else if (getDeviceType() == iphoneProMaxSize) {
      return 16;
    }
    return 18;
  }

  static double appBarFontSize(String getFont) {
    if (getFont == uniQaidar && getDeviceType() == iphoneProSize) {
      return 19;
    } else if (getFont == uniQaidar && getDeviceType() == iphoneProMaxSize) {
      return 20;
    }
    return 17;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String getFont(BuildContext context) {
    return Provider.of<FontProvider>(context, listen: false).getFont;
  }
}
