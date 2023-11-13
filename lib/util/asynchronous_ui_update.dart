import 'package:bashakam_barawzanko/components/my_progress_indicator.dart';
import 'package:bashakam_barawzanko/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsynchronousUIUpdate {
  double homePageImageSize(BuildContext context) {
    if (Constants.getDeviceType() == Constants.iphoneProSize ||
        Constants.getDeviceType() == Constants.iphoneProMaxSize) {
      return MediaQuery.of(context).size.width * 0.5;
    } else if (Constants.getDeviceType() == Constants.tabletSize) {
      return MediaQuery.of(context).size.width * 0.29;
    } else {
      return 270;
    }
  }

  String imageLightThemeAsset = 'assets/images/cats_.svg';
  String imageDarkThemeAsset = 'assets/images/cats_darkMode.svg';
  FutureBuilder<bool> asyncHomePageImageUpdate(
      String imageLightThemeAsset, String imageDarkThemeAsset) {
    return FutureBuilder<bool>(
      future: SharedPreferences.getInstance().then(
        (sharedPrefs) => sharedPrefs.getBool('_isDark') ?? false,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final isDark = snapshot.data ?? false;

          return SvgPicture.asset(
            isDark ? imageLightThemeAsset : imageDarkThemeAsset,
            width: homePageImageSize(context),
          );
        } else {
          // Handle loading state or error.
          return const MyProgressIndicator(); // or any other loading widget
        }
      },
    );
  }

  //* 📩
  FutureBuilder<bool> asyncMailIconUpdate() {
    return FutureBuilder<bool>(
      future: SharedPreferences.getInstance().then(
        (sharedPrefs) => sharedPrefs.getBool('_isDark') ?? false,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final isDark = snapshot.data ?? false;

          return Image.asset(
            isDark
                ? "assets/images/social_icons/arroba_dark_mode.png"
                : "assets/images/social_icons/arroba_light_mode.png",
            height: 25,
          );
        } else {
          return const MyProgressIndicator();
        }
      },
    );
  }

  FutureBuilder<bool> asyncLinkdinIconUpdate() {
    return FutureBuilder<bool>(
      future: SharedPreferences.getInstance().then(
        (sharedPrefs) => sharedPrefs.getBool('_isDark') ?? false,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final isDark = snapshot.data ?? false;

          return Image.asset(
            isDark
                ? "assets/images/social_icons/linkedin_dark_mode.png"
                : "assets/images/social_icons/linkedin_light_mode.png",
            height: 25,
          );
        } else {
          return const MyProgressIndicator();
        }
      },
    );
  }

  FutureBuilder<bool> asyncGitHubIconUpdate() {
    return FutureBuilder<bool>(
      future: SharedPreferences.getInstance().then(
        (sharedPrefs) => sharedPrefs.getBool('_isDark') ?? false,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final isDark = snapshot.data ?? false;

          return Image.asset(
            isDark
                ? "assets/images/social_icons/github_dark_mode.png"
                : "assets/images/social_icons/github_light_mode.png",
            height: 25,
          );
        } else {
          return const MyProgressIndicator();
        }
      },
    );
  }

  FutureBuilder<bool> asyncFacebookIconUpdate() {
    return FutureBuilder<bool>(
      future: SharedPreferences.getInstance().then(
        (sharedPrefs) => sharedPrefs.getBool('_isDark') ?? false,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final isDark = snapshot.data ?? false;

          return Image.asset(
            isDark
                ? "assets/images/social_icons/facebook_dark_mode.png"
                : "assets/images/social_icons/facebook_light_mode.png",
            height: 25,
          );
        } else {
          return const MyProgressIndicator();
        }
      },
    );
  }

  FutureBuilder<bool> asyncTelegramIconUpdate() {
    return FutureBuilder<bool>(
      future: SharedPreferences.getInstance().then(
        (sharedPrefs) => sharedPrefs.getBool('_isDark') ?? false,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final isDark = snapshot.data ?? false;

          return Image.asset(
            isDark
                ? "assets/images/social_icons/telegram_dark_mode.png"
                : "assets/images/social_icons/telegram_light_mode.png",
            height: 25,
          );
        } else {
          return const MyProgressIndicator();
        }
      },
    );
  }

  FutureBuilder<bool> asyncInstagramIconUpdate() {
    return FutureBuilder<bool>(
      future: SharedPreferences.getInstance().then(
        (sharedPrefs) => sharedPrefs.getBool('_isDark') ?? false,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final isDark = snapshot.data ?? false;

          return Image.asset(
            isDark
                ? "assets/images/social_icons/instagram_dark_mode.png"
                : "assets/images/social_icons/instagram_light_mode.png",
            height: 25,
          );
        } else {
          return const MyProgressIndicator();
        }
      },
    );
  }
}
