// ignore_for_file: avoid_print
import 'package:bashakam_barawzanko/components/my_textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connectivity/connectivity.dart';
import '../../components/my_floating_action_button.dart';
import '../../constantes/them_colors.dart';
import '../../components/my_appbar.dart';
import '../../components/my_show_dialog.dart';
import '../../helpers/hive_helper.dart';
import '../../widgets/konmra_list_item.dart';
import 'dart:io';

class KamtrinKonmra extends StatefulWidget {
  const KamtrinKonmra({Key? key}) : super(key: key);

  @override
  State<KamtrinKonmra> createState() => _KamtrinKonmraState();
}

class _KamtrinKonmraState extends State<KamtrinKonmra> {
  final TextEditingController _textEditingController = TextEditingController();

  List<Map<String, dynamic>> departments = [];
  List<Map<String, dynamic>> _foundUsers = [];

  List<String> university = [];
  List<String> collage = [];
  List<String> departmentName = [];

  List<String> pZankoline = [];
  List<String> pParallel = [];
  List<String> pEwaran = [];

  List<String> gZankoline = [];
  List<String> gParallel = [];
  List<String> gEwaran = [];

  bool isLoading = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    checkConnectivity(context);
    _fetchData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    isLoading = true;

    try {
      departments =
          await HiveHelper.importDataFromCsv('assets/data/CSV(2021-2022).csv');

      university =
          departments.map((data) => data['university'] as String).toList();
      collage = departments
          .map((data) => data['collage_institute'] as String)
          .toList();
      departmentName =
          departments.map((data) => data['department'] as String).toList();

      pZankoline =
          departments.map((data) => data['p_zankoline'] as String).toList();
      pParallel =
          departments.map((data) => data['p_parallel'] as String).toList();
      pEwaran = departments.map((data) => data['p_ewaran'] as String).toList();

      gZankoline =
          departments.map((data) => data['g_zankoline'] as String).toList();
      gParallel =
          departments.map((data) => data['g_parallel'] as String).toList();
      gEwaran = departments.map((data) => data['g_ewaran'] as String).toList();

      setState(() {
        _foundUsers = List.from(departments);
      });

      // Print the university, collage, and department names after processing by Hive
      // print('Processed Data:');
      // for (var i = 0; i < departmentName.length; i++) {
      //   print('${university[i]} / ${collage[i]} / ${departmentName[i]}');
      // }
    } catch (error) {
      print('fetch data error: $error');
      const ConnectionDialog();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> checkConnectivity(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      const ConnectionDialog();
    }
  }

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      setState(() {
        _foundUsers = List.from(departments);
      });
    } else {
      List<Map<String, dynamic>> filteredList = departments.where((data) {
        final departmentName = data['department'] as String;
        return departmentName.contains(enteredKeyword);
      }).toList();

      setState(() {
        _foundUsers =
            filteredList; // Update the filtered list with the matching items.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final svgPicture = SvgPicture.asset(
      'assets/images/ListIsEmpty.svg',
      height: 350,
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: ThemeColors.kBodyColor,
        appBar: const MyAppBar(
          text: 'کەمترین کۆنمرەی وەرگیراو',
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: MyTextField(
                textController: _textEditingController,
                labelText: 'ناوی بەش یاخود کۆنمرە بنووسە',
                onChanged: (value) => _runFilter(value),
                onPressed: () {},
              ),
            ),
            if (isLoading)
              const SizedBox(
                height: 40,
                child: Center(
                  child: CupertinoActivityIndicator(
                    color: ThemeColors.kWhiteTextColor,
                  ),
                ),
              ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      controller: _scrollController,
                      itemBuilder: (context, index) => SlemaniKonmraListItem(
                        departments: _foundUsers,
                        index: index,
                      ),
                      itemCount: _foundUsers.length,
                    )
                  : Center(
                      child: Column(
                        children: [
                          svgPicture,
                          const Text(
                            '! هیچ بەشێک نەدۆزرایەوە',
                            style: TextStyle(
                              color: ThemeColors.kWhiteTextColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
        floatingActionButton: MyFloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: ((context) {
                return FractionallySizedBox(
                  heightFactor: 0.7,
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
                              padding: EdgeInsets.all(25.0),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  "- ئەم لیستی کۆنمرە هی سالی (٢٠٢١-٢٠٢٢)ـە. ساڵانە نوێ دەکرێتەوە.\n\n"
                                  "- وشەی (گشتی) واتە نمرەی پێویست بۆ قوتابیانی دەرەوی شار. ئەگەر تۆ لە سلێمانی دەژیت و دەتەوێت لە هەولێر یاخود دهۆک وەربگیرێیت ئەوا پێویستە سێری نمرەی (گشتی) بکەیت.\n\n"
                                  "- وشەی (پارێزگا) واتە نمرەی پێویست بۆ قوتابیانی ئەو پارێزگایە(ئەو شارە). ئەگەر تۆ قوتابیەکی شاری سلێمانیت، وە خوودی بەشەکە لە سلێمانیە، ئەوا تۆ پێویستە سێری نمرەی (پارێزگا) بکەیت.\n\n"
                                  "- ئەم ئەپڵیکەیشنە لە سەرەتای گەشەپێدان دایە، کاتێک بۆ بەشێک دەگەڕێیت تکایە چەند هەنگاوێک بگرە بەر:\n\n"
                                  "• هەندێجار بۆ بەشێک دەگەڕێیت، وەک (ڕووپێوان)، ئەگەر بنووسیت (روبیوان) هیچ ئەنجامێک پیشان نادرێت.\n\n"
                                  "• زیاتر لە ٥٠٠ بەش بوونی هەیە لەم ئەپڵیکەشینە، لە لایەن منی گەشەپێدەر نەنوسراون، من تەنها پیشانیان دەدەمەوە، ئەکرێ هەڵەی ڕێزمانی بوونی هەبێت لەناوی بەشەکاندا.\n\n"
                                  "• هەندێ بەشی تێدایە، وەک تەکنەلۆجیای زانیاری، بە ناوی تریش تۆمارکراوە وەک IT. بۆیە ئاگاداری ئەوانەش بدە تکایە.\n\n"
                                  "• هەندێ جار تۆ بۆ بەشی (پەرستاری پێنجوێن) دەگەڕێیت، کە دەنووسیت (پەرستاری) بەتەنها، هیچ دەرەنجامێکی نابێت. بەڵکوو بنووسە (پەرستاری پ) پیشان دەدرێت.\n\n"
                                  "• ئەگەر بێزاربوویت لە سێرچ کردن(نوسینی بەشەکان) بە ڵام هیچ دەرەنجامێکی نەهێنا، ئەکرێ هەڵەی ڕێزمانی بوونی هەبێت، یاخود ئەو بەشە بە ڕێزمانێکی هەڵە نوسرابێت. پێشنیار دەکەم خۆت بگەڕێیت بەناو لیستەکەدا تاوەکوو بەشی دڵخوازت بدۆزیتەوە.\n\n"
                                  "لەکاتی بوونی کێشە لە نمرە، ئپڵیکەیشن یاخود هەرشتێکی تر، پەیوەندی بە گەشەپێدەرەوە بکە.\n\n",
                                  style: TextStyle(
                                    color: ThemeColors.kWhiteTextColor,
                                    fontFamily: "rabar_009",
                                    fontSize: 16,
                                  ),
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
          },
        ),
      ),
    );
  }
}
