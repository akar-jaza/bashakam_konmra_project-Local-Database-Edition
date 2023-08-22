import 'dart:io';
import 'package:flutter/material.dart';
import '../constantes/them_colors.dart';

Future<dynamic> showCustomModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: ((context) {
      return FractionallySizedBox(
        heightFactor: 0.75,
        child: Container(
          decoration: const BoxDecoration(
            color: ThemeColors.kBodyColor,
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
            body: const SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "- ئەم لیستی کۆنمرە هی ساڵی (2022)ـە. ساڵانە نوێ دەکرێتەوە.\n\n"
                      "- وشەی (گشتی) واتە نمرەی پێویست بۆ قوتابیانی دەرەوی شار. ئەگەر تۆ لە سلێمانی دەژیت و دەتەوێت لە هەولێر یاخود دهۆک وەربگیرێیت ئەوا پێویستە سێری نمرەی (گشتی) بکەیت.\n\n"
                      "- وشەی (پارێزگا) واتە نمرەی پێویست بۆ قوتابیانی ئەو پارێزگایە(ئەو شارە). ئەگەر تۆ قوتابیەکی شاری سلێمانیت، وە خوودی بەشەکە لە سلێمانیە، ئەوا تۆ پێویستە سێری نمرەی (پارێزگا) بکەیت.\n\n"
                      "- ئەم ئەپڵیکەیشنە لە سەرەتای گەشەپێدان دایە، کاتێک بۆ بەشێک دەگەڕێیت تکایە چەند هەنگاوێک بگرە بەر:\n\n"
                      "• هەندێجار بۆ بەشێک دەگەڕێیت، وەک (ڕووپێوان)، ئەگەر بنووسیت (روبیوان) هیچ ئەنجامێک پیشان نادرێت.\n\n"
                      "• زیاتر لە ٥٠٠ بەش بوونی هەیە لەم ئەپڵیکەشینە، لە لایەن منی گەشەپێدەر نەنوسراون، من تەنها پیشانیان دەدەمەوە، ئەکرێ هەڵەی ڕێزمانی بوونی هەبێت لەناوی بەشەکاندا.\n\n"
                      "• هەندێ بەشی تێدایە، وەک تەکنەلۆجیای زانیاری، بە ناوی تریش تۆمارکراوە وەک (IT). بۆیە ئاگاداری ئەوانەش بدە تکایە.\n\n"
                      "• هەندێ جار تۆ بۆ بەشی (پەرستاری پێنجوێن) دەگەڕێیت، کە دەنووسیت (پەرستاری) بەتەنها، هیچ دەرەنجامێکی نابێت. بەڵکوو بنووسە (پەرستاری پ) پیشان دەدرێت.\n\n"
                      "• ئەگەر بێزاربوویت لە سێرچ کردن(نوسینی بەشەکان) بەڵام هیچ دەرەنجامێکی نەهێنا، ئەکرێ هەڵەی ڕێزمانی بوونی هەبێت، یاخود ئەو بەشە بە ڕێزمانێکی هەڵە نوسرابێت. پێشنیار دەکەم خۆت بگەڕێیت بەناو لیستەکەدا تاوەکوو بەشی دڵخوازت بدۆزیتەوە.\n\n"
                      "لەکاتی بوونی کێشە لە نمرە، ئەپڵیکەیشن یاخود هەرشتێکی تر، پەیوەندی بە گەشەپێدەرەوە بکە.\n\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "rabar_009",
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }),
  );
}
