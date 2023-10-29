import 'dart:io';
import 'package:bashakam_barawzanko/Providers/font_provider.dart';
import 'package:bashakam_barawzanko/components/my_alert_dialog.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

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
      body: Column(
        children: [
          Expanded(
            child: ListView(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 16),
                    child: Center(
                      child: Text(
                        "فۆنتی ئەپڵکەیشن بەم شێوەیە دەردەکەوێت",
                        style: TextStyle(
                          fontFamily: selectedFont,
                          fontSize: 20.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Divider(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      thickness: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Platform.isIOS
              ? CupertinoButton(child: Text(""), onPressed: (() {}))
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                  child: FilledButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 20)),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return MyAlertDialog(
                              iconData: CupertinoIcons.arrow_2_circlepath,
                              title: 'ئەپڵیکەیشنەکە ڕێستارت دەبێت',
                              content:
                                  'بۆ ئەوەی گۆڕانکاریەکان ببینیت دەبێت ئەپڵیکەیشنەکەت ڕێستارت ببێت',
                              firstActionDialogText: 'باشە',
                              firstActionOnTap: () => Restart.restartApp(),
                            );
                          }));
                    },
                    child: Text(
                      "گۆڕینی فۆنت",
                      style: TextStyle(
                        fontSize: _btnFontSize(),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  double _btnFontSize() {
    if (selectedFont == "RabarBold") {
      return 14;
    } else if (selectedFont == "sanFranciscoUITextMedium") {
      return 17;
    } else {
      return 17;
    }
  }
}
