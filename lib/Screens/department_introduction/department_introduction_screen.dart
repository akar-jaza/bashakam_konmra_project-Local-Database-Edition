// ignore_for_file: avoid_print

import 'package:bashakam_barawzanko/csv_importers/import_department_introduction_csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/my_appbar.dart';
import '../../components/my_textfiled.dart';
import '../../constantes/them_colors.dart';
import '../../list_items/department_introduction_list_item.dart';

class DepartmentIntroductionScreen extends StatefulWidget {
  const DepartmentIntroductionScreen({super.key});

  @override
  State<DepartmentIntroductionScreen> createState() =>
      _DepartmentIntroductionScreenState();
}

class _DepartmentIntroductionScreenState
    extends State<DepartmentIntroductionScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  List<Map<String, dynamic>> departmentIntroduction = [];
  List<Map<String, dynamic>> _foundDepartment = [];
  List<String> departmentName = [];
  List<String> introduction = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  Future<void> _fetchData() async {
    isLoading = true;

    try {
      departmentIntroduction =
          await ImportDepartmentIntroduction.importDataFromCsv(
              'assets/data/bashakan_info(CSV).csv');

      // Sort the departmentIntroduction list based on department names
      // departmentIntroduction
      //     .sort((a, b) => a['departmentName'].compareTo(b['departmentName']));

      departmentName = departmentIntroduction
          .map((data) => data['departmentName'] as String)
          .toList();
      introduction = departmentIntroduction
          .map((data) => data['introduction'] as String)
          .toList();

      setState(() {
        _foundDepartment = List.from(departmentIntroduction);
      });

      // Print the university, collage, and department names after processing by Hive
      // print('Processed Data:');
      // for (var i = 0; i < departmentName.length; i++) {
      //   print('${departmentName[i]} / ${introduction[i]}');
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
        _foundDepartment = List.from(departmentIntroduction);
      });
    } else {
      List<Map<String, dynamic>> filteredList =
          departmentIntroduction.where((data) {
        final departmentName = data['departmentName'] as String;
        return departmentName.contains(enteredKeyword);
      }).toList();

      setState(() {
        _foundDepartment =
            filteredList; // Update the filtered list with the matching items.
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
          text: 'ناساندنی بەشەکان',
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    color: ThemeColors.kBodyTextColor,
                  ),
                ),
              ),
            if (!isLoading)
              Expanded(
                child: _foundDepartment.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (context, index) =>
                            DepartmentIntroductionListItem(
                          departments: _foundDepartment,
                          index: index,
                        ),
                        itemCount: _foundDepartment.length,
                      )
                    : Center(
                        child: Column(
                          children: [
                            svgPicture,
                            const Directionality(
                              // To ensure correct text ordering in Kurdish (RTL), we're using Directionality widget.
                              textDirection: TextDirection.ltr,
                              child: Text(
                                '!هیچ بەشێک نەدۆزرایەوە',
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
    );
  }
}
