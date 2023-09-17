import 'dart:io';
import 'package:flutter/material.dart';
import '../constantes/them_colors.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<dynamic> showCustomModalBottomSheet(BuildContext context) {
  return androidModalBottomSheet(context);
}

// Future<dynamic> cupertinoModalBottomSheet(BuildContext context) {
//   return showCupertinoModalBottomSheet(
//     context: context,
//     builder: (context) => Container(),
//   );
// }

Future<dynamic> androidModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: ThemeColors.kMyCardColor,
    isScrollControlled: true,
    context: context,
    builder: ((context) {
      return FractionallySizedBox(
        heightFactor: 0.75,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors
                .transparent, // Set the Scaffold's background to transparent

            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(25),
              child: AppBar(
                automaticallyImplyLeading: false,
                surfaceTintColor: ThemeColors.kMyCardColor,
                leading: null,
                title: Platform.isIOS
                    ? Image.asset(
                        "assets/images/drag_handle_ios.png",
                        width: 40,
                      )
                    : Center(
                        child: Image.asset(
                          "assets/images/drag_handle_android.png",
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
                      child: pleaseReadMeText(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }),
  );
}

Text pleaseReadMeText() {
  return const Text(
    "• ئەم لیستی کۆنمرە هی ساڵی (2022-2023)ـە. ساڵانە نوێ دەکرێتەوە.\n\n"
    "• وشەی (گشتی) واتە نمرەی پێویست بۆ قوتابیانی دەرەوی شار. ئەگەر تۆ لە سلێمانی دەژیت و دەتەوێت لە هەولێر یاخود دهۆک وەربگیرێیت ئەوا پێویستە سێری نمرەی (گشتی) بکەیت.\n\n"
    "• وشەی (پارێزگا) واتە نمرەی پێویست بۆ قوتابیانی ئەو پارێزگایە(ئەو شارە). ئەگەر تۆ قوتابیەکی شاری سلێمانیت، وە خوودی بەشەکە لە سلێمانیە، ئەوا تۆ پێویستە سێری نمرەی (پارێزگا) بکەیت.\n\n"
    "• ئەم ئەپڵیکەیشنە لە سەرەتای گەشەپێدان دایە، کاتێک بۆ بەشێک دەگەڕێیت تکایە چەند هەنگاوێک بگرە بەر:\n\n"
    "• هەندێجار بۆ بەشێک دەگەڕێیت، وەک (ڕووپێوان)، ئەگەر بنووسیت (روبیوان) هیچ ئەنجامێک پیشان نادرێت.\n\n"
    "• زیاتر لە ٥٠٠ بەش بوونی هەیە لەم ئەپڵیکەشینە، لە لایەن منی گەشەپێدەر نەنوسراون، من تەنها پیشانیان دەدەمەوە، ئەکرێ هەڵەی ڕێزمانی بوونی هەبێت لەناوی بەشەکاندا.\n\n"
    "• کاتێک بۆ بەشێک دەگێڕیت وەک (پەرستاری) لەدوای وشەکەوە یەک سپەیس دابنێ دەرەنجامی زیاترت پێ نیشان دەدرێت.\n\n"
    "• هەندێ بەشی هەیە وەک تەکنەلۆجیای زانیاری، تۆ بە ئایتی بیستووتە، ئەگەر بگەڕێیت بۆ وشەی ئایتی ئەکرێ دەرەنجامی نەبێت، بنووسە تەکنەلۆجیای زانیاری دەرەنجامێکی درووستتر پیشان دەدرێت .\n\n"
    "• ئەگەر بێزاربوویت لە سێرچ کردن(نوسینی بەشەکان) بەڵام هیچ دەرەنجامێکی نەهێنا، ئەکرێ هەڵەی ڕێزمانی بوونی هەبێت، یاخود ئەو بەشە بە ڕێزمانێکی هەڵە نوسرابێت. پێشنیار دەکەم خۆت بگەڕێیت بەناو لیستەکەدا تاوەکوو بەشی دڵخوازت بدۆزیتەوە.\n\n"
    "لەکاتی بوونی کێشە لە نمرە، ئەپڵیکەیشن یاخود هەرشتێکی تر، پەیوەندی بە گەشەپێدەرەوە بکە.\n\n",
    style: TextStyle(
      color: Colors.white,
      fontFamily: "rabar_009",
      fontSize: 16,
    ),
  );
}
