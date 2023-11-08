// ignore_for_file: avoid_print

import 'dart:io';

import 'package:bashakam_barawzanko/components/my_snack_bar.dart';
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
    print({"launcher err: $e"});
    const MySnackBar(
      contentText: 'نەتوانرا بڕواتە سەر گیتهەب',
    );
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
    const MySnackBar(
      contentText: 'نەتوانرا بڕواتە سەر لینکدئن',
    );
  }
}

void launchEmailToDeveloper() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path:
        'akar.jaza1212@gmail.com', // Replace with the developer's email address
    queryParameters: {
      'subject': 'پێشنیار یاخود پرسیار', // Subject for the email
    },
  );

  if (await canLaunchUrl(Uri.parse(emailLaunchUri.toString()))) {
    await launchUrl(Uri.parse(emailLaunchUri.toString()));
  } else {
    print('Could not launch email app.');
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
    const MySnackBar(
      contentText: 'نەتوانرا بڕواتە سەر ئینستاگرام',
    );
  }
}

void launchlTelegramURL(BuildContext context) async {
  final url = Uri.parse(
      'https://l.instagram.com/?u=https%3A%2F%2Ft.me%2Fengvevanetrefa&e=AT0MpWmzrOUWI6YLlScpNRBsMov0vMzdPwn_RrBJL7WaWmgvrfqBAc3a6lsq_j8yd2clr-E84tBUeD4dqvNu_2HC_DVxzGF3dz3oTQ');
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
    const MySnackBar(
      contentText: 'نەتوانرا بڕواتە سەر ئینستاگرام',
    );
  }
}
