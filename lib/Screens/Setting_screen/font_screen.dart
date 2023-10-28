import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontScreen extends StatefulWidget {
  const FontScreen({super.key});

  @override
  State<FontScreen> createState() => _FontScreenState();
}

class _FontScreenState extends State<FontScreen> {
  String selectedFont = "rabarBold"; // Default font

  // Add this method to retrieve the selected font from SharedPreferences.
  Future<void> getSelectedFont() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedFont = prefs.getString('selectedFont') ?? "rabarBold";
    });
  }

  // Add this method to save the selected font to SharedPreferences.
  Future<void> saveSelectedFont(String font) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedFont', font);
  }

  @override
  void initState() {
    super.initState();
    getSelectedFont(); // Retrieve the selected font when the app starts.
  }

  List<Map<String, String>> fontOptions = [
    {
      "title": "فۆنتی ڕابەر",
      "subtitle": "فۆنتی سەرەکی ئەپڵیکەیشن",
      "family": "rabarBold",
    },
    {
      "title": "فۆنتی سان فرانسیسکۆ - ئاسایی",
      "subtitle": "",
      "family": "sanFranciscoUITextRegular"
    },
    {
      "title": "فۆنتی سان فرانسیسکۆ - تۆخ",
      "subtitle":
          "فۆنتی سان فرانسیسکۆ فۆنتێکی مۆدێرنە، سادەیە و ئاسانە بۆ خوێندنەوە، درووستکراوی کۆمپانیای ئەپڵە تایبەت بە ئامێرەکانی خۆی.",
      "family": "sanFranciscoUITextMedium",
    },
    {
      "title": "فۆنتی یونی قەیدار",
      "subtitle":
          "فۆنتی یونی قەیدار دیزاینێکی جوانی هەیە و گونجاوە بۆ خوێندنەوە",
      "family": "uniQaidar",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const MyCupertinoAppBar(enableLeading: true, middleText: 'فۆنتی ئەپ'),
      body: ListView(
        children: [
          for (var option in fontOptions)
            RadioListTile<String>(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(option["title"]!),
              ),
              value: option["family"]!,
              subtitle: Text(option["subtitle"]!),
              groupValue: selectedFont,
              onChanged: (value) {
                setState(() {
                  selectedFont = value!;
                  saveSelectedFont(selectedFont); // Save the selected font.
                });
              },
            ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
              child: Center(
                child: Text(
                  "فۆنتی ئەپڵکەیشن بەم شێوەیە دەردەکەوێت",
                  style: TextStyle(
                    fontFamily: selectedFont,
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
