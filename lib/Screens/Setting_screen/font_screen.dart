import 'dart:io';
import 'package:bashakam_barawzanko/Providers/font_provider.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:bashakam_barawzanko/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class FontScreen extends StatefulWidget {
  const FontScreen({super.key});

  @override
  State<FontScreen> createState() => _FontScreenState();
}

class _FontScreenState extends State<FontScreen> {
  String selectedFont = FontProvider.defaultFont;
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
      "title": "فۆنتی یونی قەیدار",
      "family": "uniQaidar",
      "subtitle": "فۆنتی سەرەکی ئەپڵیکەیشن",
    },
    {
      "title": "فۆنتی سان فرانسیسکۆ",
      "family": "sanFranciscoUITextBold",
      "subtitle":
          "فۆنتی سان فرانسیسکۆ فۆنتێکی مۆدێرنە، سادەیە و ئاسانە بۆ خوێندنەوە، درووستکراوی کۆمپانیای ئەپڵە تایبەت بە ئامێرەکانی خۆی.",
    },
    {
      "title": "فۆنتی ڕابەر",
      "family": "rabarBold",
      "subtitle": "فۆنتی ڕابەر دیزاینێکی جوانی هەیە و گونجاوە بۆ خوێندنەوە.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    String deviceIsAndroidContainerText =
        "ئەم بەشە تایبەتە بە گۆڕینی فۆنتی ئەپڵیکەیشن. گۆڕینی فۆنت پێویستی بە دەستپێکردنەوە (Restart)ـی ئەپڵیکەشنە!";

    String deviceIsIOSContainerText =
        "ڕێستارتی ئەپڵیکەیشن پێویستە بۆ گۆڕینی فۆنت، تکایە بەرنامەکە دابخە و بیکەرەوە!";

    return Scaffold(
      appBar:
          const MyCupertinoAppBar(enableLeading: true, middleText: 'فۆنتی ئەپ'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 0),
            child: Container(
              width: Constants.getScreenWidth(context) * 0.876,
              height: 115,
              decoration: BoxDecoration(
                color: Platform.isIOS
                    ? Theme.of(context).colorScheme.errorContainer
                    : Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: _iconBottomPadding()),
                      child: Icon(
                        Platform.isIOS
                            ? CupertinoIcons.exclamationmark_triangle_fill
                            : CupertinoIcons.lightbulb_fill,
                        color: Platform.isIOS
                            ? Theme.of(context).colorScheme.onErrorContainer
                            : Theme.of(context).colorScheme.onTertiaryContainer,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Platform.isIOS
                        ? Flexible(
                            child: Text(
                              deviceIsIOSContainerText,
                              style: TextStyle(
                                fontSize: _containerTextFontSize(),
                                overflow: TextOverflow.fade,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                                fontFamily: selectedFont,
                              ),
                            ),
                          )
                        : Flexible(
                            child: Text(
                              deviceIsAndroidContainerText,
                              style: TextStyle(
                                  height: selectedFont == "rabarBold"
                                      ? 1.8
                                      : selectedFont == "sanFranciscoUITextBold"
                                          ? 1.6
                                          : null,
                                  fontSize: _containerTextFontSize(),
                                  overflow: TextOverflow.fade,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer,
                                  fontFamily: selectedFont),
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
          //change font app.
          Flexible(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      left: Constants.getScreenWidth(context) / 16,
                      right: Constants.getScreenWidth(context) / 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: <Widget>[
                          for (var option in fontOptions)
                            RadioListTile<String>(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  option["title"]!,
                                  style: TextStyle(fontFamily: selectedFont),
                                ),
                              ),
                              value: option["family"]!,
                              subtitle: Text(
                                option["subtitle"]!,
                                style: TextStyle(
                                    fontSize:
                                        selectedFont == "rabarBold" ? 13 : null,
                                    fontFamily: selectedFont),
                              ),
                              groupValue: selectedFont,
                              onChanged: (value) {
                                setState(() {
                                  selectedFont = value!;
                                  FontProvider.saveSelectedFont(selectedFont);
                                });
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      left: Constants.getScreenWidth(context) / 16,
                      right: Constants.getScreenWidth(context) / 16),
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "فۆنتی ئەپڵکەیشن بەم شێوەیە دەردەکەوێت",
                        style: TextStyle(
                          fontFamily: selectedFont,
                          fontSize: _fontResultSize(),
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          !Platform.isIOS
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                  child: FilledButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 20)),
                    ),
                    onPressed: () {
                      Restart.restartApp();
                      // showDialog(
                      //   barrierDismissible: true,
                      //   context: context,
                      //   builder: ((context) {
                      //     return MyAlertDialog(
                      //       iconData: CupertinoIcons.arrow_2_circlepath,
                      //       title: 'ئەپڵیکەیشنەکە ڕێستارت دەبێت',
                      //       content:
                      //           'بۆ ئەوەی گۆڕانکاریەکان ببینیت دەبێت ئەپڵیکەیشنەکەت ڕێستارت ببێت',
                      //       firstActionDialogText: 'باشە',
                      //       firstActionOnTap: () => Restart.restartApp(),
                      //     );
                      //   }),
                      // );
                    },
                    child: Text(
                      "گۆڕینی فۆنت",
                      style: TextStyle(
                        fontSize: _btnFontSize(),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  double _iconBottomPadding() {
    if (getDeviceType() == 'tablet') {
      return 0;
    } else if (Platform.isIOS && getDeviceType() == "phone") {
      return 20;
    } else if (getDeviceType() == "phone") {
      return 40;
    }

    return 0;
  }

  double _containerTextFontSize() {
    if (selectedFont == Constants.rabarBold && getDeviceType() == "tablet") {
      return 17;
    } else if (selectedFont == Constants.sanFranciscoUITextBold &&
        getDeviceType() == "tablet") {
      return 18;
    } else if (getDeviceType() == "tablet") {
      return 18;
    } else if (selectedFont == Constants.rabarBold) {
      return 13;
    } else if (selectedFont == Constants.sanFranciscoUITextBold) {
      return 13;
    } else {
      return 15;
    }
  }

  double _btnFontSize() {
    if (selectedFont == "rabarBold") {
      return 17;
    } else if (selectedFont == "sanFranciscoUITextMedium") {
      return 17;
    } else {
      return 17;
    }
  }

  double _fontResultSize() {
    if (selectedFont == "rabarBold") {
      return 15;
    } else if (selectedFont == "sanFranciscoUITextMedium") {
      return 16;
    } else {
      return 16;
    }
  }
}

String getDeviceType() {
  final MediaQueryData data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.single);

  return data.size.shortestSide < 600 ? 'phone' : 'tablet';
}
