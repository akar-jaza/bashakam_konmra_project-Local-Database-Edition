// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
import 'package:bashakam_barawzanko/Providers/font_provider.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:bashakam_barawzanko/components/my_textfiled.dart';
import 'package:bashakam_barawzanko/csv_importers/fetch_konmra_cities/import_duhok_konmra_csv.dart';
import 'package:bashakam_barawzanko/csv_importers/fetch_konmra_cities/import_hawler_konmra_csv.dart';
import 'package:bashakam_barawzanko/csv_importers/fetch_konmra_cities/import_slemani_konmra_csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/my_custom_modal_bottom_sheet.dart';
// import '../../components/my_floating_action_button.dart';
import 'konmra_list_item.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class KamtrinKonmra extends StatefulWidget {
  const KamtrinKonmra({Key? key}) : super(key: key);

  @override
  State<KamtrinKonmra> createState() => _KamtrinKonmraState();
}

class _KamtrinKonmraState extends State<KamtrinKonmra> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late StreamSubscription<bool> keyboardSubscription;
  // ignore: unused_field
  bool _isKeyboardVisible = false;
  bool _isLoading = false;
  bool _slemaniIsChecked = false;
  bool _hawlerIsChecked = false;
  bool _duhokIsChecked = false;
  bool _isScreenLoaded = false;
  int duruationTime = Platform.isIOS ? 0 : 500;

  // bool _isFabVisible = true;

  @override
  void initState() {
    super.initState();

    // Delay loading data by 500 milliseconds

    _fetchSlemaniData();
    _fetchHawlerData();
    _fetchDuhokData();

    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      _isKeyboardVisible = visible;
    });
    _isKeyboardVisible = false;

    // Mark the screen as fully loaded
    setState(() {
      _isScreenLoaded = true;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    keyboardSubscription.cancel();

    super.dispose();
  }

  List<Map<String, dynamic>> konmra = [];
  List<Map<String, dynamic>> _foundUsers = [];

  List<Map<String, dynamic>> slemaniKonmra = [],
      hawlerKonmra = [],
      duhokKonmra = [];

  // ignore: unused_field
  List<Map<String, dynamic>> _slemaniFoundUsers = [],
      // ignore: unused_field
      _hawlerFoundUsers = [],
      // ignore: unused_field
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

  Future<void> _fetchSlemaniData() async {
    _isLoading = true;

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
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchHawlerData() async {
    _isLoading = true;

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
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchDuhokData() async {
    _isLoading = true;

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
        _isLoading = false;
      });
    }
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> filteredList = [];

    if (!_slemaniIsChecked && !_hawlerIsChecked && !_duhokIsChecked) {
      filteredList.addAll(slemaniKonmra);
      filteredList.addAll(hawlerKonmra);
      filteredList.addAll(duhokKonmra);
    }
    if (_slemaniIsChecked) {
      filteredList.addAll(slemaniKonmra);
    }
    if (_hawlerIsChecked) {
      filteredList.addAll(hawlerKonmra);
    }
    if (_duhokIsChecked) {
      filteredList.addAll(duhokKonmra);
    }

    filteredList = filteredList.where((data) {
      final departmentName = data['department'] as String;
      final pZankoline = data['p_zankoline'] as String;
      final pParallel = data['p_parallel'] as String;
      final pEwaran = data['p_ewaran'] as String;
      final gZankoline = data['g_zankoline'] as String;
      final gParallel = data['g_parallel'] as String;
      final gEwaran = data['g_ewaran'] as String;

      return departmentName.contains(enteredKeyword) ||
          (pZankoline.contains(enteredKeyword)) ||
          (pParallel.contains(enteredKeyword)) ||
          (pEwaran.contains(enteredKeyword)) ||
          (gZankoline.contains(enteredKeyword)) ||
          (gParallel.contains(enteredKeyword)) ||
          (gEwaran.contains(enteredKeyword));
    }).toList();
    setState(() {
      _foundUsers = filteredList;
    });
  }

  String getDeviceType() {
    final MediaQueryData data = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single);

    return data.size.shortestSide < 380 ? 'SE_size' : 'phone';
  }

  @override
  Widget build(BuildContext context) {
    final svgPicture = SvgPicture.asset(
      'assets/images/ListIsEmpty.svg',
      height: getDeviceType() == "SE_size" ? 200 : 300,
    );

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: MyCupertinoAppBar(
            enableLeading: true,
            middleText: 'کەمترین کۆنمرەی وەرگیراو',
            trailing: IconButton(
              onPressed: (() {
                showCustomModalBottomSheet(context, _text, 0.75);
              }),
              icon: Icon(
                CupertinoIcons.info_circle_fill,
                color: Theme.of(context).colorScheme.primary,
                size: 23,
              ),
            ),
          ),
          body: _isScreenLoaded
              ? NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    if (notification.direction == ScrollDirection.forward) {
                      setState(() {
                        // _isFabVisible = true;
                      });
                    } else if (notification.direction ==
                        ScrollDirection.reverse) {
                      setState(() {
                        // _isFabVisible = false;
                      });
                    }
                    return true;
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 0,
                          left: 20,
                          right: 20,
                          top: Platform.isIOS ? 10 : 15,
                        ),
                        child: Column(
                          children: [
                            MyTextField(
                              textController: _textEditingController,
                              labelText: 'ناوی بەش بنووسە',
                              onChanged: (value) {
                                setState(() {
                                  if (MediaQuery.of(context).viewInsets.bottom >
                                      0.0) {
                                  } else {
                                    // _isFabVisible = true;
                                  }
                                });
                                _runFilter(value);
                              },
                              onPressed: () {},
                              suffixIcon: Platform.isIOS
                                  ? CupertinoButton(
                                      onPressed: (() =>
                                          filterByCityModalBottomSheet(
                                            context,
                                          )),
                                      child: Icon(
                                        CupertinoIcons.slider_horizontal_3,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: IconButton(
                                        onPressed: () =>
                                            filterByCityModalBottomSheet(
                                          context,
                                        ),
                                        icon: Icon(
                                          CupertinoIcons.slider_horizontal_3,
                                          size: 26,
                                          weight: 100,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant,
                                        ),
                                      ),
                                    ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, right: 5, bottom: 5),
                                child: Text(
                                  'دەتوانێت بەپێی کۆنمرە بەش بدۆزیتەوە، بەڵام ورد نیە!',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_isLoading)
                        SizedBox(
                          height: 40,
                          child: Center(
                            child: CupertinoActivityIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      Expanded(
                        flex: 1,
                        child: _foundUsers.isNotEmpty
                            ? ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
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
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Text(
                                        '! هیچ بەشێک نەدۆزرایەوە',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontSize: getDeviceType() == "SE_size"
                                              ? 16
                                              : 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                )
              : const Center(child: CupertinoActivityIndicator()),

          // floatingActionButton: AnimatedOpacity(
          //   opacity: _isKeyboardVisible ? 0.0 : 1.0,
          //   duration: Duration(milliseconds: 50),
          //   child: Directionality(
          //     textDirection: TextDirection.ltr,
          //     child: AnimatedAlign(
          //       duration: Duration(milliseconds: 500),
          //       alignment:
          //           _isFabVisible ? Alignment.bottomLeft : Alignment(-1.0, 2.0),
          //       curve: Curves.fastOutSlowIn,
          //       child: MyFloatingActionButton(
          //         onPressed: () {
          //           _isKeyboardVisible
          //               ? null
          //               : showCustomModalBottomSheet(context);
          //         },
          //       ),
          //     ),
          //   ),
          // )),
        ));
  }

  // Future<void> _showModalBottomSheet(BuildContext context) {
  //   return filterByCityModalBottomSheet(
  //       context, _slemaniIsChecked, _hawlerIsChecked, _duhokIsChecked, (p0) {});
  // }

  Future<void> filterByCityModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return SizedBox(
              height: 260,
              child: Theme(
                data: ThemeData(
                  splashColor: Platform.isIOS ? Colors.transparent : null,
                  highlightColor: Platform.isIOS ? Colors.transparent : null,
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium?.fontFamily,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "گەڕان بەپێی شار",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: FontProvider.defaultFont == "uniQaidar"
                                ? 18
                                : 16,
                          ),
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      title: Text(
                        "سلێمانی",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
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
                      activeColor: Theme.of(context).colorScheme.onBackground,
                      checkColor: Theme.of(context).colorScheme.onTertiary,
                      side: _slemaniIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                width: 1.0,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    CheckboxListTile(
                      title: Text(
                        "هەولێر",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
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
                      activeColor: Theme.of(context).colorScheme.onBackground,
                      checkColor: Theme.of(context).colorScheme.onTertiary,
                      side: _hawlerIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                width: 1.0,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    CheckboxListTile(
                      title: Text(
                        "دهۆک",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
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
                      activeColor: Theme.of(context).colorScheme.onBackground,
                      checkColor: Theme.of(context).colorScheme.onTertiary,
                      side: _duhokIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                width: 1.0,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
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

String _text =
    "• ئەم لیستی کۆنمرە هی ساڵی (2022-2023)ـە. ساڵانە نوێ دەکرێتەوە.\n\n"
    "• وشەی (گشتی) واتە نمرەی پێویست بۆ قوتابیانی دەرەوی شار. ئەگەر تۆ لە سلێمانی دەژیت و دەتەوێت لە هەولێر یاخود دهۆک وەربگیرێیت ئەوا پێویستە سێری نمرەی (گشتی) بکەیت.\n\n"
    "• وشەی (پارێزگا) واتە نمرەی پێویست بۆ قوتابیانی ئەو پارێزگایە(ئەو شارە). ئەگەر تۆ قوتابیەکی شاری سلێمانیت، وە خوودی بەشەکە لە سلێمانیە، ئەوا تۆ پێویستە سێری نمرەی (پارێزگا) بکەیت.\n\n"
    "• ئەم ئەپڵیکەیشنە لە سەرەتای گەشەپێدان دایە، کاتێک بۆ بەشێک دەگەڕێیت تکایە چەند هەنگاوێک بگرە بەر:\n\n"
    "• هەندێجار بۆ بەشێک دەگەڕێیت، وەک (ڕووپێوان)، ئەگەر بنووسیت (روبیوان) هیچ ئەنجامێک پیشان نادرێت.\n\n"
    "• زیاتر لە ٥٠٠ بەش بوونی هەیە لەم ئەپڵیکەشینە، لە لایەن منی گەشەپێدەر نەنوسراون، من تەنها پیشانیان دەدەمەوە، ئەکرێ هەڵەی ڕێزمانی بوونی هەبێت لەناوی بەشەکاندا.\n\n"
    "• کاتێک بۆ بەشێک دەگێڕیت وەک (پەرستاری) لەدوای وشەکەوە یەک سپەیس دابنێ دەرەنجامی زیاترت پێ نیشان دەدرێت.\n\n"
    "• هەندێ بەشی هەیە وەک تەکنەلۆجیای زانیاری، تۆ بە ئایتی بیستووتە، ئەگەر بگەڕێیت بۆ وشەی ئایتی ئەکرێ دەرەنجامی نەبێت، بنووسە تەکنەلۆجیای زانیاری دەرەنجامێکی درووستتر پیشان دەدرێت .\n\n"
    "• ئەگەر بێزاربوویت لە سێرچ کردن(نوسینی بەشەکان) بەڵام هیچ دەرەنجامێکی نەهێنا، ئەکرێ هەڵەی ڕێزمانی بوونی هەبێت، یاخود ئەو بەشە بە ڕێزمانێکی هەڵە نوسرابێت. پێشنیار دەکەم خۆت بگەڕێیت بەناو لیستەکەدا تاوەکوو بەشی دڵخوازت بدۆزیتەوە.\n\n"
    "لەکاتی بوونی کێشە لە نمرە، ئەپڵیکەیشن یاخود هەرشتێکی تر، پەیوەندی بە گەشەپێدەرەوە بکە.\n\n";
