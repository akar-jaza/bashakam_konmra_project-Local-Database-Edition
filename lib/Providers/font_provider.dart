import 'package:bashakam_barawzanko/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontProvider extends ChangeNotifier {
  static String defaultFont = Constants.uniQaidar; // Default font
  String get getFont => defaultFont; // Initialize getFont with a default font

  FontProvider(String getFont) {
    if (getFont == Constants.rabarBold) {
      defaultFont = Constants.rabarBold;
    } else if (getFont == Constants.sanFranciscoUITextRegular) {
      defaultFont == Constants.sanFranciscoUITextRegular;
    } else if (getFont == Constants.sanFranciscoUITextBold) {
      defaultFont = Constants.sanFranciscoUITextBold;
    } else if (getFont == Constants.sanFranciscoUITextHeavy) {
      defaultFont = Constants.sanFranciscoUITextHeavy;
    } else if (getFont == Constants.uniQaidar) {
      defaultFont = Constants.uniQaidar;
    } else {
      defaultFont = Constants.uniQaidar;
    }

    getSelectedFont().then((font) {
      getFont = font;
      notifyListeners();
    });
  }

  // Add this static method to retrieve the selected font from SharedPreferences.
  static Future<String> getSelectedFont() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('selectedFont') ?? "uniQaidar";
  }

  // Add this static method to save the selected font to SharedPreferences.
  static Future<void> saveSelectedFont(String font) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedFont', font);
  }

  @override
  notifyListeners();
}
