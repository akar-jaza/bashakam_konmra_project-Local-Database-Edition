// ignore_for_file: avoid_print
import 'dart:io';

import 'package:bashakam_barawzanko/components/my_textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/my_custom_modal_bottom_sheet.dart';
import '../../components/my_floating_action_button.dart';
import '../../constantes/them_colors.dart';
import '../../components/my_appbar.dart';
import '../../csv_importers/import_konmra_csv.dart';
import '../../list_items/konmra_list_item.dart';

class KamtrinKonmra extends StatefulWidget {
  const KamtrinKonmra({Key? key}) : super(key: key);

  @override
  State<KamtrinKonmra> createState() => _KamtrinKonmraState();
}

class _KamtrinKonmraState extends State<KamtrinKonmra> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> konmra = [];
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
  bool _slemaniIsChecked = false;
  bool _hawlerIsChecked = false;
  bool _duhokIsChecked = false;

  bool isFabVisible = true;

  @override
  void initState() {
    super.initState();
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
      konmra = await ImportKonmraCsv.importDataFromCsv(
          'assets/data/CSV(2021-2022).csv');

      university = konmra.map((data) => data['university'] as String).toList();
      collage =
          konmra.map((data) => data['collage_institute'] as String).toList();
      departmentName =
          konmra.map((data) => data['department'] as String).toList();

      pZankoline = konmra.map((data) => data['p_zankoline'] as String).toList();
      pParallel = konmra.map((data) => data['p_parallel'] as String).toList();
      pEwaran = konmra.map((data) => data['p_ewaran'] as String).toList();

      gZankoline = konmra.map((data) => data['g_zankoline'] as String).toList();
      gParallel = konmra.map((data) => data['g_parallel'] as String).toList();
      gEwaran = konmra.map((data) => data['g_ewaran'] as String).toList();

      setState(() {
        _foundUsers = List.from(konmra);
      });

      // Print the university, collage, and department names after processing by Hive
      // print('Processed Data:');
      // for (var i = 0; i < departmentName.length; i++) {
      //   print('${university[i]} / ${collage[i]} / ${departmentName[i]}');
      // }
    } catch (error) {
      print('fetch data error: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      setState(() {
        _foundUsers = List.from(konmra);
      });
    } else {
      List<Map<String, dynamic>> filteredList = konmra.where((data) {
        final departmentName = data['department'] as String;
        final pZankoline = data['p_zankoline'] as String;
        final pParallel = data['p_parallel'] as String;
        final pEwaran = data['p_ewaran'] as String;
        final gZankoline = data['g_zankoline'] as String;
        final gParallel = data['g_parallel'] as String;
        final gEwaran = data['g_ewaran'] as String;

        return departmentName.contains(enteredKeyword) ||
            pZankoline.contains(enteredKeyword) ||
            pParallel.contains(enteredKeyword) ||
            pEwaran.contains(enteredKeyword) ||
            gZankoline.contains(enteredKeyword) ||
            gParallel.contains(enteredKeyword) ||
            gEwaran.contains(enteredKeyword);
      }).toList();

      setState(() {
        _foundUsers = filteredList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final svgPicture = SvgPicture.asset(
      'assets/images/ListIsEmpty.svg',
      height: 300,
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: ThemeColors.kBodyColor,
        appBar: const MyAppBar(
          text: 'کەمترین کۆنمرەی وەرگیراو',
        ),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                isFabVisible = true;
              });
            } else if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                isFabVisible = false;
              });
            }
            return true;
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                child: Row(
                  children: [
                    Platform.isIOS
                        ? CupertinoButton(
                            onPressed: () {
                              filterByCityModalBottomSheet(context);
                            },
                            child: const Icon(
                              CupertinoIcons.slider_horizontal_3,
                              color: ThemeColors.kBodyTextColor,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: IconButton(
                              onPressed: (() {
                                filterByCityModalBottomSheet(context);
                              }),
                              icon: const Icon(
                                Icons.tune_outlined,
                                size: 26,
                                color: ThemeColors.kBodyTextColor,
                              ),
                            ),
                          ),
                    Expanded(
                      flex: 2,
                      child: MyTextField(
                        textController: _textEditingController,
                        labelText: 'ناوی بەش یاخود کۆنمرە بنووسە',
                        onChanged: (value) => _runFilter(value),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading)
                const SizedBox(
                  height: 40,
                  child: Center(
                    child: CupertinoActivityIndicator(
                      color: ThemeColors.kBodyTextColor,
                    ),
                  ),
                ),
              Expanded(
                child: _foundUsers.isNotEmpty
                    ? ListView.builder(
                        controller: _scrollController,
                        itemBuilder: (context, index) => KonmraListItem(
                          departments: _foundUsers,
                          index: index,
                        ),
                        itemCount: _foundUsers.length,
                      )
                    : Center(
                        child: Column(
                          children: [
                            svgPicture,
                            const Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                '! هیچ بەشێک نەدۆزرایەوە',
                                style: TextStyle(
                                  color: ThemeColors.kBodyTextColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
        floatingActionButton: Directionality(
          textDirection: TextDirection.ltr,
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 500),
            alignment: isFabVisible
                ? Alignment.bottomLeft
                : const Alignment(-1.0, 2.0),
            curve: Curves.fastOutSlowIn,
            child: MyFloatingActionButton(
              onPressed: () {
                showCustomModalBottomSheet(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> filterByCityModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      backgroundColor: ThemeColors.kMyCardColor,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return SizedBox(
              height: 300,
              child: Theme(
                data: ThemeData(
                  splashColor: Platform.isIOS ? Colors.transparent : null,
                  highlightColor: Platform.isIOS ? Colors.transparent : null,
                  fontFamily: "rabarBold",
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "گەڕان بەپێی شار",
                          style: TextStyle(
                              color: ThemeColors.kBodyTextColor, fontSize: 16),
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "سلێمانی",
                        style: TextStyle(
                          color: ThemeColors.kBodyTextColor,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _slemaniIsChecked,
                      onChanged: ((value) {
                        setState(() {
                          _slemaniIsChecked = value!;
                          print(value);
                        });
                      }),
                      activeColor: ThemeColors.kBoldBlueTextColor,
                      checkColor: ThemeColors.kBodyTextColor,
                      side: _slemaniIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                                width: 1.0,
                                color: ThemeColors.kBodyTextColor,
                              ),
                            ),
                    ),
                    // const Divider(
                    //   height: 0,
                    //   color: Color.fromARGB(
                    //       72, 197, 198, 209),
                    // ),
                    CheckboxListTile(
                      title: const Text(
                        "هەولێر",
                        style: TextStyle(
                          color: ThemeColors.kBodyTextColor,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _hawlerIsChecked,
                      onChanged: ((value) {
                        setState(() {
                          _hawlerIsChecked = value!;
                        });
                      }),
                      activeColor: ThemeColors.kBoldBlueTextColor,
                      checkColor: ThemeColors.kBodyTextColor,
                      side: _hawlerIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                                width: 1.0,
                                color: ThemeColors.kBodyTextColor,
                              ),
                            ),
                    ),

                    CheckboxListTile(
                      title: const Text(
                        "دهۆک",
                        style: TextStyle(
                          color: ThemeColors.kBodyTextColor,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _duhokIsChecked,
                      onChanged: ((value) {
                        setState(() {
                          _duhokIsChecked = value!;
                        });
                      }),
                      activeColor: ThemeColors.kBoldBlueTextColor,
                      checkColor: ThemeColors.kBodyTextColor,
                      side: _duhokIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                                width: 1.0,
                                color: ThemeColors.kBodyTextColor,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
