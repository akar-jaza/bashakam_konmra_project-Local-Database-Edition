// ignore_for_file: use_build_context_synchronously, avoid_print
import 'package:bashakam_barawzanko/components/my_textfiled.dart';
import 'package:bashakam_barawzanko/widgets/slemani_konmra_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unorm_dart/unorm_dart.dart';
import '../../API/fetch_all_cities.dart';
import '../../Models/department_data.dart';
import '../../components/my_appbar.dart';
import '../../components/my_show_dialog.dart';
import '../../constantes/systemUi_overlay_helper.dart';
import 'package:connectivity/connectivity.dart';

import '../../constantes/them_colors.dart';

class KamtrinKonmra extends StatefulWidget {
  const KamtrinKonmra({Key? key}) : super(key: key);

  @override
  State<KamtrinKonmra> createState() => _KamtrinKonmraState();
}

class _KamtrinKonmraState extends State<KamtrinKonmra> {
  SystemUiOverlayHelper uiOverlayFunc = SystemUiOverlayHelper();
  final TextEditingController _textEditingController = TextEditingController();

  List<DepartmentData> departments = [];
  List<String> departmentName = [];
  List<String> parezga = [];
  List<String> gshty = [];
  List<String> filteredDepartmentName = [];

  List<DepartmentData> originalDepartments = [];

  bool isLoading = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    checkConnectivity(context);
    _fetchData();

    filteredDepartmentName = List.from(departmentName);
    // Initialize the originalDepartments list with the same data as departments
    originalDepartments = List.from(departments);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    isLoading = true;

    try {
      final data = await fetchData();
      if (data != null) {
        // Clear the previous data before adding new data
        departments.clear();
        departmentName.clear();
        parezga.clear();
        gshty.clear();

        // Fetch data from the API and loop through the results to create DepartmentData objects
        for (int i = 0; i < data['departmentName'].length; i++) {
          DepartmentData departmentData = DepartmentData(
            departmentName: data['departmentName'][i],
            parezga: data['parezga'][i],
            gshty: data['gshty'][i],
          );
          departments.add(departmentData);
          departmentName.add(data['departmentName'][i]);
          parezga.add(data['parezga'][i]);
          gshty.add(data['gshty'][i]);
        }

        setState(() {
          // Update both departments and originalDepartments lists with the fetched data
          filteredDepartmentName = List.from(departmentName);
          departments = List.from(departments);
          originalDepartments = List.from(departments);
        });
      } else {
        const ConnectionDialog(string: 'Please connect to a network and try again.');
      }
    } catch (error) {
      print('Error: $error');
      ConnectionDialog(string: error.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Future<void> _getMoreData() async {
  //   if (!isLoading) {

  //     setState(() {
  //       isLoading = true;
  //     });
  //     try {
  //       final data = await fetchData();
  //       if (data != null) {
  //         setState(() {
  //           departmentName.addAll(data['departmentName'].cast<String>());
  //           parezga.addAll(data['parezga'].cast<String>());
  //           gshty.addAll(data['gshty'].cast<String>());
  //           filteredDepartmentName = List.from(departmentName);
  //         });
  //       } else {
  //         showConnectionDialog(context);
  //       }
  //     } catch (error) {
  //       print('Error: $error');
  //       showConnectionDialog(context);
  //     } finally {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   }
  // }

  void _runFilter(String enteredKeyword) {
    final normalizedQuery = nfc(enteredKeyword);

    if (normalizedQuery.isEmpty) {
      setState(() {
        // When the search query is empty, show all data from originalDepartments
        departments = List.from(originalDepartments);
      });
      return;
    }

    List<DepartmentData> filteredList = originalDepartments
        .where((data) => nfc(data.departmentName)
            .toLowerCase()
            .contains(normalizedQuery.toLowerCase()))
        .toList();
    setState(() {
      // When the search query is not empty, show the filtered data
      departments = filteredList;
    });
  }

  Future<void> checkConnectivity(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      const ConnectionDialog(string: 'Please connect to a network and try again.');
    }
  }

  // void _initScrollController() {
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       _getMoreData();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    uiOverlayFunc.setSystemUiOverlayStyle();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: ThemeColors.kBodyColor,
        appBar: const MyAppBar(text: 'کەمترین کۆنمرەی وەرگیراو'),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: MyTextField(
                onPressed: () {},
                onChanged: (value) => _runFilter(value),
                textController: _textEditingController,
                labelText: 'ناوی بەش یاخود کۆنمرە بنووسە',
              ),
            ),
            if (isLoading)
              const SizedBox(
                height: 40,
                child: Center(
                    child: CupertinoActivityIndicator(
                  color: ThemeColors.kWhiteTextColor,
                )),
              ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) => SlemaniKonmraListItem(
                  departments: departments,
                  index: index,
                ),
                itemCount: departments.length *
                    2, // Double the length for divider items
              ),
            ),
          ],
        ),
      ),
    );
  }
}
