// ignore_for_file: avoid_print
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
import '../../widgets/konmra_list_item.dart';

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: MyTextField(
                  textController: _textEditingController,
                  labelText: 'ناوی بەش بنووسە',
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
        ),
        floatingActionButton: AnimatedAlign(
          duration: const Duration(milliseconds: 500),
          alignment:
              isFabVisible ? Alignment.bottomRight : const Alignment(1, 2),
          curve: Curves.fastOutSlowIn,
          child: MyFloatingActionButton(
            onPressed: () {
              showCustomModalBottomSheet(context);
            },
          ),
        ),
      ),
    );
  }
}
