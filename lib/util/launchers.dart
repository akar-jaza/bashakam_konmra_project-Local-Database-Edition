// ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously

import 'dart:io';

import 'package:bashakam_barawzanko/components/my_alert_dialog.dart';
import 'package:bashakam_barawzanko/components/my_snack_bar.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void launchFacebookURL(BuildContext context) async {
  String fbProtocolUrl;
  if (Platform.isIOS) {
    fbProtocolUrl = 'fb://profile/akar.jaza011';
  } else {
    fbProtocolUrl = 'fb://page/akar.jaza011';
  }

  String fallbackUrl = 'https://www.facebook.com/akar.jaza011';

  try {
    bool launched = await launchUrl(Uri.parse(fbProtocolUrl));

    if (launched) {
      print(launched);
      await launchUrl(
        Uri.parse(fbProtocolUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      await launchUrl(
        Uri.parse(fallbackUrl),
        mode: LaunchMode.externalApplication,
      );
    }
  } catch (e) {
    print(e);
  }
}

void launchGitHubURL(BuildContext context) async {
  final url = Uri.parse('https://github.com/akar-jaza');
  final bool nativeAppLaunchSucceeded = await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  );
  try {
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
      );
    }
  } catch (e) {
    print("Couldn't launch: $e");
    final snackBar = mySnackBar(
        context: context,
        titleText:
            'کێشەیەک بوونی هەیە لە کردنەوەی ئەکاونتی گیتهەبەکەم، تکایە دواتر هەوڵبدەرەوە یاخود پەیوەندی بە گەشەپێدەرەوە بکە.');
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

void launchlinkdedInURL(BuildContext context) async {
  final url = Uri.parse('https://www.linkedin.com/in/akar-ii0i/');
  final bool nativeAppLaunchSucceeded = await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  );
  try {
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
      );
    }
  } catch (e) {
    print({"launcher err: $e"});
    final snackBar = mySnackBar(
        context: context,
        titleText:
            'کێشەیەک هەبوو لە کردنەوەی لینکدئن، تکایە پەیوەندی بە گەشەپێدەرەوە بکە.');
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

void launchEmailToDeveloper(BuildContext context) async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path:
          'akar.jaza1212@gmail.com', // Replace with the developer's email address
      query: encodeQueryParameters(
          <String, String>{'subjet': 'پێشنیار یاخود پرسیار'}));

  if (await canLaunchUrl(emailLaunchUri)) {
    launchUrl(emailLaunchUri);
  } else {
    print("Couldn't launch: $emailLaunchUri");
    showDialog(
        context: context,
        builder: ((context) {
          return MyAlertDialog(
            enableFirstActionDialog: true,
            title: 'کێشە هەیە لە کردنەوەی ئەپڵیکەشنی ئیمەیڵ!',
            content:
                'وادیارە بەڕێزتان ئەپڵیکەیشنی جیمەیڵتان نیە یاخود کێشەیەک هەیە لە کردنەوەیدا. تکایە ئیمەیڵەکەم کۆپی بکە و بەڕێگایەکی تر ئیمەیڵم بۆ بنێرە.',
            firstActionDialogText: 'کۆپی ئیمەیڵ',
            secondActionDialogText: 'داخستن',
            firstActionOnTap: () async {
              Navigator.pop(context);
              await Clipboard.setData(
                const ClipboardData(text: "akar.jaza1212@gmail.com"),
              );
              final snackbar = mySnackBar(
                  context: context, titleText: 'ئیمەیڵی گەشەپێدەر کۆپی کرا.');
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            secondActionOnTap: () {
              Navigator.pop(context);
              print("pressed clos");
            },
          );
        }));
  }
}

void launchlInstagramURL(BuildContext context) async {
  final url = Uri.parse('https://www.instagram.com/eng.vevanetrefa/');
  final bool nativeAppLaunchSucceeded = await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  );
  try {
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
      );
    }
  } catch (e) {
    print({"launcher err: $e"});
    final snackBar = mySnackBar(
        context: context,
        titleText:
            'کێشەیەک هەبوو لە کردنەوەی ئینستاگرام، تکایە پەیوەندی بە گەشەپێدەرەوە بکە.');
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

void launchlTelegramURL(BuildContext context) async {
  final url = Uri.parse('https://t.me/engvevanetrefa');
  final bool nativeAppLaunchSucceeded = await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  );
  try {
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
      );
    }
  } catch (e) {
    print({"launcher err: $e"});
    final snackBar = mySnackBar(
        context: context,
        titleText:
            'کێشەیەک هەبوو لە کردنەوەی تێلێگرام، تکایە پەیوەندی بە گەشەپێدەرەوە بکە.');
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
