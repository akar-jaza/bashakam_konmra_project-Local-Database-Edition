import 'package:bashakam_barawzanko/Providers/font_provider.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:bashakam_barawzanko/constantes/theme_colors.dart';
import 'package:flutter/material.dart';

class FontScreen extends StatefulWidget {
  const FontScreen({super.key});

  @override
  State<FontScreen> createState() => _FontScreenState();
}

class _FontScreenState extends State<FontScreen> {
  String selectedFont = FontProvider.defaultFont; // Default font
  @override
  void initState() {
    super.initState();

    FontProvider.getSelectedFont().then((font) {
      setState(() {
        selectedFont = font;
      });
    }); // Retrieve the selected font when the app starts.
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
                  FontProvider.saveSelectedFont(
                      selectedFont); // Save the selected font.
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
