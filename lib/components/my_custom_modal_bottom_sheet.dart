import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<dynamic> showCustomModalBottomSheet(BuildContext context, String text, double heightFactor) {
  return androidModalBottomSheet(context, text, heightFactor);
}

// Future<dynamic> cupertinoModalBottomSheet(BuildContext context) {
//   return showCupertinoModalBottomSheet(
//     context: context,
//     builder: (context) => Container(),
//   );
// }

Future<dynamic> androidModalBottomSheet(BuildContext context, String text, double? heightFactor) {
  return showModalBottomSheet(
    backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
    isScrollControlled: true,
    context: context,
    builder: ((context) {
      return FractionallySizedBox(
        heightFactor: heightFactor,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors
              .transparent, // Set the Scaffold's background to transparent
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(25),
            child: AppBar(
              automaticallyImplyLeading: false,
              // surfaceTintColor: Theme.of(context).colorScheme.onBackground,
              scrolledUnderElevation: 0,
              leading: null,
              title: Platform.isIOS
                  ? Image.asset(
                      "assets/images/drag_handle_ios.png",
                      color: Theme.of(context).colorScheme.onBackground,
                      width: 40,
                    )
                  : Center(
                      child: Image.asset(
                        "assets/images/drag_handle_android.png",
                        color: Theme.of(context).colorScheme.onBackground,
                        width: 45,
                      ),
                    ),
              backgroundColor: Colors
                  .transparent, // Set the AppBar's background to transparent
              elevation: 0,
            ),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: pleaseReadMeText(context, text),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }),
  );
}

Text pleaseReadMeText(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      color: Theme.of(context).colorScheme.onBackground,
      // fontFamily: "rabar_009",
      fontSize: 16,
    ),
  );
}
