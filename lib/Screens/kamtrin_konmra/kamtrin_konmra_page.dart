import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart'; // Import the csv package
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unorm_dart/unorm_dart.dart';
import 'package:connectivity/connectivity.dart';

import '../../constantes/them_colors.dart';
import '../../components/my_appbar.dart';
import '../../components/my_show_dialog.dart';
import '../../Models/department_data.dart';
import '../../helpers/hive_helper.dart';
import '../../widgets/slemani_konmra_list_item.dart';

class KamtrinKonmra extends StatefulWidget {
  const KamtrinKonmra({Key? key}) : super(key: key);

  @override
  State<KamtrinKonmra> createState() => _KamtrinKonmraState();
}

class _KamtrinKonmraState extends State<KamtrinKonmra> {
  final TextEditingController _textEditingController = TextEditingController();

  List<Map<String, dynamic>> departments = [];
  List<String> departmentName = [];
  List<String> parezga = [];
  List<String> gshty = [];
  List<String> filteredDepartmentName = [];

  bool isLoading = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    checkConnectivity(context);
    _fetchData();

    filteredDepartmentName = List.from(departmentName);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    isLoading = true;

    try {
      departments = await HiveHelper.importDataFromCsv('assets/data.csv');
      departmentName =
          departments.map((data) => data['department'] as String).toList();
      parezga =
          departments.map((data) => data['p_zankoline'] as String).toList();
      gshty = departments.map((data) => data['g_zankoline'] as String).toList();

      setState(() {
        filteredDepartmentName = List.from(departmentName);
      });
    } catch (error) {
      print('Error: $error');
      ConnectionDialog(string: error.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> checkConnectivity(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      const ConnectionDialog(
          string: 'Please connect to a network and try again.');
    }
  }

  void _runFilter(String enteredKeyword) {
    // final normalizedQuery = nfc(enteredKeyword);

    // if (normalizedQuery.isEmpty) {
    //   setState(() {
    //     departments = List.from(originalDepartments);
    //   });
    //   return;
    // }

    // List<Map<String, dynamic>> filteredList = departments.where((data) {
    //   final departmentName = data['department'] as String;
    //   return nfc(departmentName).toLowerCase().contains(normalizedQuery.toLowerCase());
    // }).toList();
    // setState(() {
    //   departments = filteredList;
    // });
  }

  @override
  Widget build(BuildContext context) {
    print(departments);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: ThemeColors.kBodyColor,
        appBar: const MyAppBar(text: 'کەمترین کۆنمرەی وەرگیراو'),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: 'ناوی بەش یاخود کۆنمرە بنووسە',
                ),
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
                  departments: departments,
                  index: index,
                ),
                itemCount: departments.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
