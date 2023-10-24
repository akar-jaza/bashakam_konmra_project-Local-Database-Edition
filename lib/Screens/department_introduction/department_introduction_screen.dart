// ignore_for_file: avoid_print

import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:bashakam_barawzanko/csv_importers/import_department_introduction_csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/my_textfiled.dart';
import '../../constantes/theme_colors.dart';
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

      departmentName = departmentIntroduction
          .map((data) => data['departmentName'] as String)
          .toList();
      introduction = departmentIntroduction
          .map((data) => data['introduction'] as String)
          .toList();

      setState(() {
        _foundDepartment = List.from(departmentIntroduction);
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
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const MyCupertinoAppBar(
          enableLeading: true,
          middleText: 'ناساندنی بەشەکان',
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
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        physics: const BouncingScrollPhysics(),
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
                            Directionality(
                              // To ensure correct text ordering in Kurdish (RTL), we're using Directionality widget.
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
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
