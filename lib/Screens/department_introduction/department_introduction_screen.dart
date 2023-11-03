// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:bashakam_barawzanko/components/my_progress_indicator.dart';
import 'package:bashakam_barawzanko/csv_importers/import_department_introduction_csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/my_textfiled.dart';
import 'department_introduction_list_item.dart';

//! 1
//* ئەم سکرینیە بریتیە لە ناساندنی بەشەکان
//* لیستی بەشەکان پیشان دەدرێت
//* یوزەر دەتوانێت سێرچ بۆ بەش بکات

class DepartmentIntroductionScreenTemp extends StatefulWidget {
  const DepartmentIntroductionScreenTemp({super.key});

  @override
  State<DepartmentIntroductionScreenTemp> createState() =>
      _DepartmentIntroductionScreenTempState();
}

class _DepartmentIntroductionScreenTempState
    extends State<DepartmentIntroductionScreenTemp> {
  //* fetchData
  Future<List<Map<String, dynamic>>?> fetchData() async {
    try {
      return await ImportDepartmentIntroduction.importDataFromCsv(
          'assets/data/bashakan_info(CSV).csv');
    } catch (error) {
      print('fetch data error: $error');
      return null;
    }
  }

  final TextEditingController _textEditingController = TextEditingController();
  // Remove departmentIntroduction, departmentName, introduction, and isLoading from your state as they will be managed by FutureBuilder.

  Future<List<Map<String, dynamic>>?>? _data; // Store the future data.
  List<Map<String, dynamic>> _foundDepartment = [];
  bool isFoundDepartmentFethed = false;

  @override
  void initState() {
    super.initState();
    _data = fetchData();
    _fetchFoundDepartment();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  _fetchFoundDepartment() {
    fetchData().then((value) {
      _foundDepartment = value!;
      isFoundDepartmentFethed = true; // Set it to true after data is fetched.
      setState(() {}); // Trigger a rebuild to update the UI.
    });
  }

  void _runFilter(String enteredKeyword, List<Map<String, dynamic>> data) {
    if (enteredKeyword.isEmpty) {
      setState(() {
        // If the keyword is empty, display all data.
        _foundDepartment = List.from(data);
        print("is empty");
      });
    } else {
      List<Map<String, dynamic>> filteredList = data.where((data) {
        final departmentName = data['departmentName'] as String;
        return departmentName.contains(enteredKeyword);
      }).toList();
      print(enteredKeyword);
      setState(() {
        _foundDepartment =
            filteredList; // Update the filtered list with the matching items.
      });
    }
  }

  final svgPicture = SvgPicture.asset(
    'assets/images/ListIsEmpty.svg',
    height: 300,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const MyCupertinoAppBar(
          enableLeading: true,
          middleText: 'ناساندنی بەشەکان',
        ),
        body: FutureBuilder<List<Map<String, dynamic>>?>(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: MyProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    svgPicture,
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        '!هیچ بەشێک نەدۆزرایەوە',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // Data is loaded, you can now use the snapshot.data to build your list.
              final departmentIntroduction = snapshot.data!;
              final departmentName = departmentIntroduction
                  .map((data) => data['departmentName'] as String)
                  .toList();

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: MyTextField(
                      textController: _textEditingController,
                      labelText: 'ناوی بەش بنووسە',
                      onChanged: (value) => _runFilter(value, snapshot.data!),
                      onPressed: () {},
                    ),
                  ),
                  if (!isFoundDepartmentFethed) // found department not fetched yet
                    const MyProgressIndicator()
                  else
                    _foundDepartment.isNotEmpty
                        ? Expanded(
                            child: _buildList(_foundDepartment),
                          )
                        : Center(
                            // if user searchs for something and not found
                            child: Column(
                              children: [
                                svgPicture,
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text(
                                    '!هیچ بەشێک نەدۆزرایەوە',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildList(List<Map<String, dynamic>> departmentIntroduction) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => DepartmentIntroductionListItem(
        departments: departmentIntroduction,
        index: index,
      ),
      itemCount: _foundDepartment.length,
    );
  }
}
