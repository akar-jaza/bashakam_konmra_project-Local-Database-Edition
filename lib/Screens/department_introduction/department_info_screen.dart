import 'package:bashakam_barawzanko/components/my_appbar.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/material.dart';

class DepartmentInfoScreen extends StatelessWidget {
  const DepartmentInfoScreen({
    super.key,
    required this.departmentName,
    required this.introduction,
  });
  final String departmentName;
  final String introduction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: departmentName),
      backgroundColor: ThemeColors.kBodyColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Text(
            introduction,
            style: const TextStyle(
                color: ThemeColors.kWhiteTextColor, fontFamily: "rabarBold"),
          ),
        ),
      ),
    );
  }
}
