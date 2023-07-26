// ignore_for_file: avoid_print

import 'dart:io';

import 'package:bashakam_barawzanko/components/my_textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connectivity/connectivity.dart';
import '../../constantes/them_colors.dart';
import '../../components/my_appbar.dart';
import '../../components/my_show_dialog.dart';
import '../../helpers/hive_helper.dart';
import '../../widgets/konmra_list_item.dart';

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

    // setState(() {
    //   _foundUsers = List.from(departments);
    // });
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
      // Escape special characters in the entered keyword
      final escapedKeyword = RegExp.escape(enteredKeyword.trim());

      // Create a regular expression pattern to match the entered keyword anywhere within the department name, regardless of spaces
      final regexPattern = '(?=.*$escapedKeyword)';

      // Use the regular expression to match the department name
      final regex = RegExp(regexPattern, caseSensitive: false);

      List<Map<String, dynamic>> filteredList = departments.where((data) {
        final departmentName = data['department'] as String;
        return regex.hasMatch(normalizeKurdishText(departmentName.trim()));
      }).toList();

      setState(() {
        _foundUsers =
            filteredList; // Update the filtered list with the matching items.
      });
    }
  }

  String normalizeKurdishText(String text) {
    Map<String, String> replacements = {
      // Add more mappings as needed
      'ﭘ': 'پ',
      'ﭙ': 'پ',
      'ﺰ': 'ز',
      'ﯾ': 'ی',
      'ﮑ': 'ک',
      'ﺸ': 'ش',
      'ﻪ': 'ە',
      'ی': 'ی',
      'ﯽ': 'ی',
      'ﻜ': 'ک',
      'ﻰ': 'ی',
      'ﺎ': 'ا',
      'ﺄ': 'ا',
      'ﺮ': 'ر',
      'ﻣ': 'م',
      'ﯿ': 'ی',
      'ى': 'ی',
      'ﺪ': 'د',
      'ﮏ': 'ک',
      'ﺗ': 'ت',
      'ﺖ': 'ت',
      'ﻧ': 'ن',
      'ﻚ': 'ک',
      'ﻛ': 'ک',
      'ﻤ': 'م',
      'ﻓ': 'ف',
      'ﮐ': 'ک',
      'ﺳ': 'س',
      'ﺴ': 'س',
      'ﺷ': 'ش',
      'ﺘ': 'ت',
      'ﺑ': 'ب',
      'ﺒ': 'ب',
      'ﻦ': 'ن',
      'ﻨ': 'ن',
      'ﻫ': 'ه',
      'ﺧ': 'خ',
      'ﻗ': 'ق',
      'ﻘ': 'ق',
      'ﮕ': 'گ',
      'ﮔ': 'گ',
      'ﻮ': 'و',
      'ﭼ': 'چ',
      'ﺋ': 'ئ',
      'ﻔ': 'ف',
      'ﻼ': 'لا',
      'ﻻ': 'لا',
      'ﻠ': 'ل',
      'ﻟ': 'ل',
      'ﻞ': 'ل',
      'ﺟ': 'ج',
      'ﺠ': 'ج',
      'ﺣ': 'ح',
      'ﭽ': 'چ',
      'ﺻ': 'ص',
      'ﻋ': 'ع',
      'ﮋ': 'ژ',
    };

    // Replace the characters using the mapping
    // Replace the characters using the mapping
    // Replace the characters using the mapping
    String normalizedText = text.replaceAllMapped(
      RegExp('(${replacements.keys.join('|')})'),
      (match) => replacements[match.group(0)]!,
    );

    print('Original text: $text');
    print('Normalized text: $normalizedText');

    return normalizedText;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: ThemeColors.kBodyColor,
        appBar: const MyAppBar(
          text: 'کەمترین کۆنمرەی وەرگیراو',
          // cupertinoIconData: CupertinoIcons.info_circle_fill,
          // materialIconData: Icons.info,
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
              child: ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) => SlemaniKonmraListItem(
                  departments: _foundUsers,
                  index: index,
                ),
                itemCount: _foundUsers.length,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: ThemeColors.kBoldBlueTextColor,
          onPressed: () {},
          icon: Platform.isIOS
              ? const Icon(
                  CupertinoIcons.info_circle_fill,
                  color: ThemeColors.kWhiteTextColor,
                )
              : const Icon(
                  Icons.info,
                  color: ThemeColors.kblueColor,
                ),
          label: const Text('تکایە بمخوێنەرەوە'),
        ),
      ),
    );
  }
}
