// ignore_for_file: avoid_print
import 'dart:io';

import 'package:bashakam_barawzanko/components/my_textfiled.dart';
import 'package:bashakam_barawzanko/csv_importers/fetch_konmra_cities/import_duhok_konmra_csv.dart';
import 'package:bashakam_barawzanko/csv_importers/fetch_konmra_cities/import_hawler_konmra_csv.dart';
import 'package:bashakam_barawzanko/csv_importers/fetch_konmra_cities/import_slemani_konmra_csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/my_custom_modal_bottom_sheet.dart';
import '../../components/my_floating_action_button.dart';
import '../../constantes/them_colors.dart';
import '../../components/my_appbar.dart';
import '../../csv_importers/fetch_konmra_cities/import_konmra_csv.dart';
import '../../list_items/konmra_list_item.dart';

class KamtrinKonmra extends StatefulWidget {
  const KamtrinKonmra({Key? key}) : super(key: key);

  @override
  State<KamtrinKonmra> createState() => _KamtrinKonmraState();
}

class _KamtrinKonmraState extends State<KamtrinKonmra> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchSlemaniData();
    _fetchHawlerData();
    _fetchDuhokData();
    // _foundUsers = List.from(konmra);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> konmra = [];
  List<Map<String, dynamic>> _foundUsers = [];

  List<Map<String, dynamic>> slemaniKonmra = [],
      hawlerKonmra = [],
      duhokKonmra = [];

  List<Map<String, dynamic>> _slemaniFoundUsers = [],
      _hawlerFoundUsers = [],
      _duhokFoundUsers = [];

  List<String> university = [],
      collage = [],
      departmentName = [],
      pZankoline = [],
      pParallel = [],
      pEwaran = [],
      gZankoline = [],
      gParallel = [],
      gEwaran = [];

  List<String> slemaniUniversity = [],
      slemaniCollage = [],
      slemaniDepartmentName = [],
      slemanipZankoline = [],
      slemanipParallel = [],
      slemanipEwaran = [],
      slemanigZankoline = [],
      slemanigParallel = [],
      slemanigEwaran = [];

  List<String> hawlerUniversity = [],
      hawlerCollage = [],
      hawlerDepartmentName = [],
      hawlerpZankoline = [],
      hawlerpParallel = [],
      hawlerpEwaran = [],
      hawlergZankoline = [],
      hawlergParallel = [],
      hawlergEwaran = [];

  List<String> duhokUniversity = [],
      duhokCollage = [],
      duhokDepartmentName = [],
      duhokpZankoline = [],
      duhokpParallel = [],
      duhokpEwaran = [],
      duhokgZankoline = [],
      duhokgParallel = [],
      duhokgEwaran = [];

  bool isLoading = false;
  bool _slemaniIsChecked = true;
  bool _hawlerIsChecked = true;
  bool _duhokIsChecked = true;

  bool isFabVisible = true;

  Future<void> fetchDataBasedOnCheckboxes() async {
    isLoading = true;

    // Clear existing data
    konmra.clear();
    _foundUsers.clear();

    try {
      if (_slemaniIsChecked) {
        await _fetchSlemaniData();
      }
      if (_hawlerIsChecked) {
        await _fetchHawlerData();
      }
      if (_duhokIsChecked) {
        await _fetchDuhokData();
      }

      // Combine the fetched data from different cities if needed
      if (_slemaniIsChecked) {
        konmra.addAll(slemaniKonmra);
      }
      if (_hawlerIsChecked) {
        konmra.addAll(hawlerKonmra);
      }
      if (_duhokIsChecked) {
        konmra.addAll(duhokKonmra);
      }

      // Update _foundUsers based on filtered data if any filter is applied
      if (_textEditingController.text.isNotEmpty) {
        _runFilter(_textEditingController.text);
      } else {
        // No filter, just use the combined data from different cities
        _foundUsers = List.from(konmra);
      }
    } catch (error) {
      print('fetch data error: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchSlemaniData() async {
    isLoading = true;

    try {
      slemaniKonmra = await ImportSlemaniKonmraCsv.importDataFromCsv(
          'assets/data/2022_2023/slemani_2022_2023.csv');

      slemaniUniversity =
          slemaniKonmra.map((data) => data['university'] as String).toList();
      slemaniCollage = slemaniKonmra
          .map((data) => data['collage_institute'] as String)
          .toList();
      slemaniDepartmentName =
          slemaniKonmra.map((data) => data['department'] as String).toList();

      slemanipZankoline =
          slemaniKonmra.map((data) => data['p_zankoline'] as String).toList();
      slemanipParallel =
          slemaniKonmra.map((data) => data['p_parallel'] as String).toList();
      slemanipEwaran =
          slemaniKonmra.map((data) => data['p_ewaran'] as String).toList();

      slemanigZankoline =
          slemaniKonmra.map((data) => data['g_zankoline'] as String).toList();
      slemanigParallel =
          slemaniKonmra.map((data) => data['g_parallel'] as String).toList();
      slemanigEwaran =
          slemaniKonmra.map((data) => data['g_ewaran'] as String).toList();

      setState(() {
        konmra.addAll(slemaniKonmra);
        _slemaniFoundUsers = List.from(slemaniKonmra);
        _foundUsers = List.from(konmra);
      });
    } catch (error) {
      print('fetch data error: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchHawlerData() async {
    isLoading = true;

    try {
      hawlerKonmra = await ImportHawlerKonmraCsv.importDataFromCsv(
          'assets/data/2022_2023/hawler_2022_2023.csv');

      hawlerUniversity =
          hawlerKonmra.map((data) => data['university'] as String).toList();
      hawlerCollage = hawlerKonmra
          .map((data) => data['collage_institute'] as String)
          .toList();
      hawlerDepartmentName =
          hawlerKonmra.map((data) => data['department'] as String).toList();

      hawlerpZankoline =
          hawlerKonmra.map((data) => data['p_zankoline'] as String).toList();
      hawlerpParallel =
          hawlerKonmra.map((data) => data['p_parallel'] as String).toList();
      hawlerpEwaran =
          hawlerKonmra.map((data) => data['p_ewaran'] as String).toList();

      hawlergZankoline =
          hawlerKonmra.map((data) => data['g_zankoline'] as String).toList();
      hawlergParallel =
          hawlerKonmra.map((data) => data['g_parallel'] as String).toList();
      hawlergEwaran =
          hawlerKonmra.map((data) => data['g_ewaran'] as String).toList();

      setState(() {
        konmra.addAll(hawlerKonmra);
        _foundUsers = List.from(hawlerKonmra);
        _hawlerFoundUsers = List.from(hawlerKonmra);
      });
    } catch (error) {
      print('fetch data error: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchDuhokData() async {
    isLoading = true;

    try {
      duhokKonmra = await ImportDuhokKonmraCsv.importDataFromCsv(
          'assets/data/2022_2023/duhok_2022_2023.csv');

      duhokUniversity =
          duhokKonmra.map((data) => data['university'] as String).toList();
      duhokCollage = duhokKonmra
          .map((data) => data['collage_institute'] as String)
          .toList();
      duhokDepartmentName =
          duhokKonmra.map((data) => data['department'] as String).toList();

      duhokpZankoline =
          duhokKonmra.map((data) => data['p_zankoline'] as String).toList();
      duhokpParallel =
          duhokKonmra.map((data) => data['p_parallel'] as String).toList();
      duhokpEwaran =
          duhokKonmra.map((data) => data['p_ewaran'] as String).toList();

      duhokgZankoline =
          duhokKonmra.map((data) => data['g_zankoline'] as String).toList();
      duhokgParallel =
          duhokKonmra.map((data) => data['g_parallel'] as String).toList();
      duhokgEwaran =
          duhokKonmra.map((data) => data['g_ewaran'] as String).toList();

      setState(() {
        konmra.addAll(duhokKonmra);
        _foundUsers = List.from(konmra);
        _duhokFoundUsers = List.from(duhokKonmra);
      });
    } catch (error) {
      print('fetch data error: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> filteredList = [];

    if (_slemaniIsChecked) {
      filteredList.addAll(slemaniKonmra);
    }
    if (_hawlerIsChecked) {
      filteredList.addAll(hawlerKonmra);
    }
    if (_duhokIsChecked) {
      filteredList.addAll(duhokKonmra);
    }

    // Apply the text filter if needed
    if (enteredKeyword.isNotEmpty) {
      filteredList = filteredList.where((data) {
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
    }

    setState(() {
      _foundUsers = filteredList;
    });
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
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: MyTextField(
                        textController: _textEditingController,
                        labelText: 'ناوی بەش یاخود کۆنمرە بنووسە',
                        onChanged: (value) => _runFilter(value),
                        onPressed: () {
                          filterByCityModalBottomSheet(context);
                        },
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
        return Theme(
          data: ThemeData(useMaterial3: true),
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return SizedBox(
                height: 260,
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
                                color: ThemeColors.kBodyTextColor,
                                fontSize: 16),
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
                            _runFilter(_textEditingController.text);
                          });
                        }),
                        activeColor: ThemeColors.kblueColor,
                        checkColor: ThemeColors.kBodyColor,
                        side: _slemaniIsChecked
                            ? null
                            : MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                  width: 1.0,
                                  color: ThemeColors.kBodyTextColor,
                                ),
                              ),
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
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
                            _runFilter(_textEditingController.text);
                          });
                        }),
                        activeColor: ThemeColors.kblueColor,
                        checkColor: ThemeColors.kBodyColor,
                        side: _hawlerIsChecked
                            ? null
                            : MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                  width: 1.0,
                                  color: ThemeColors.kBodyTextColor,
                                ),
                              ),
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
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
                            _runFilter(_textEditingController.text);
                          });
                        }),
                        activeColor: ThemeColors.kblueColor,
                        checkColor: ThemeColors.kBodyColor,
                        side: _duhokIsChecked
                            ? null
                            : MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                  width: 1.0,
                                  color: ThemeColors.kBodyTextColor,
                                ),
                              ),
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
