import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
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
      appBar: MyCupertinoAppBar(
        enableLeading: true,
        middleText: departmentName,
        isMiddleTextBlue: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Theme(
          data: ThemeData(
            useMaterial3: false,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                introduction,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontFamily: "rabarBold",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
