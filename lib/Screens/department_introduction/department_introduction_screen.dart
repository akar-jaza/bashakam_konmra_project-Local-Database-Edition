import 'package:bashakam_barawzanko/csv_importers/import_department_introduction_csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/my_appbar.dart';
import '../../components/my_textfiled.dart';
import '../../constantes/them_colors.dart';
import '../../widgets/department_introduction_list_item.dart';

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
  List<String> departmentName = [];
  List<String> introduction = [];

  bool isLoading = false;

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

      // setState(() {
      //   _foundUsers = List.from(konmra);
      // });

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
    // if (enteredKeyword.isEmpty) {
    //   setState(() {
    //     _foundUsers = List.from(konmra);
    //   });
    // } else {
    //   List<Map<String, dynamic>> filteredList = konmra.where((data) {
    //     final departmentName = data['department'] as String;
    //     return departmentName.contains(enteredKeyword);
    //   }).toList();

    //   setState(() {
    //     _foundUsers =
    //         filteredList; // Update the filtered list with the matching items.
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
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
                    color: ThemeColors.kWhiteTextColor,
                  ),
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => DepartmentIntroductionListItem(
                  departments: departmentIntroduction,
                  index: departmentName.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
