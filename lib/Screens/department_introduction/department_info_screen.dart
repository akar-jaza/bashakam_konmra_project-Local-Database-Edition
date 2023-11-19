// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bashakam_barawzanko/components/custom_stepper_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bashakam_barawzanko/Providers/font_size_controller.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';

//! 3
//* لە دوای ئەوەی یوزەر کلیکی لەسەر هەر بەشێک کرد، ئەم کڵاسە زانیاری بەش پیشان دەداتەوە
//*
//*

class DepartmentInfoScreen extends StatefulWidget {
  const DepartmentInfoScreen({
    super.key,
    required this.departmentName,
    required this.introduction,
  });
  final String departmentName;
  final String introduction;

  @override
  State<DepartmentInfoScreen> createState() => _DepartmentInfoScreenState();
}

class _DepartmentInfoScreenState extends State<DepartmentInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCupertinoAppBar(
        enableLeading: true,
        middleText: widget.departmentName,
        isMiddleTextBlue: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Consumer<FontSizeController>(
              builder: (context, fontSizeController, child) {
                double fontSize = fontSizeController.fontSize;
                return Text(
                  widget.introduction,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    fontSize: fontSize,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: CustomStepper(
        onDecrease: () {
          setState(() {
            Provider.of<FontSizeController>(context, listen: false).decrement();
          });
        },
        onIncrease: () {
          setState(() {
            Provider.of<FontSizeController>(context, listen: false).increment();
          });
        },
        onReset: () {
          setState(() {
            Provider.of<FontSizeController>(context, listen: false).reset();
          });
        },
      ),
    );
  }
}
