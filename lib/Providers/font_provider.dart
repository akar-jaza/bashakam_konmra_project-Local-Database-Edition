import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontProvider extends ChangeNotifier {
  static String defaultFont = "rabarBold"; // Default font
  String? getFont; // Initialize getFont with a default font

  FontProvider(String getFont) {
    if (getFont == "rabarBold") {
      defaultFont = "rabarBold";
    } else if (getFont == "sanFranciscoUITextRegular") {
      defaultFont == "sanFranciscoUITextRegular";
    } else if (getFont == "sanFranciscoUITextBold") {
      defaultFont = "sanFranciscoUITextBold";
    } else if (getFont == "sanFranciscoUITextHeavy") {
      defaultFont = "sanFranciscoUITextHeavy";
    } else if (getFont == "uniQaidar") {
      defaultFont = "uniQaidar";
    } else {
      defaultFont = "rabarBold";
    }

    getSelectedFont().then((font) {
      getFont = font;
      notifyListeners();
    });
  }

  // Add this static method to retrieve the selected font from SharedPreferences.
  static Future<String> getSelectedFont() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('selectedFont') ?? "rabarBold";
  }

  // Add this static method to save the selected font to SharedPreferences.
  static Future<void> saveSelectedFont(String font) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedFont', font);
  }

  @override
  notifyListeners();
}
