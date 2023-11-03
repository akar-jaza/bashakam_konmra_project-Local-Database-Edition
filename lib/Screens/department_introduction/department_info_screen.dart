// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
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

class CustomStepper extends StatelessWidget {
  final void Function()? onDecrease;
  final void Function()? onIncrease;
  final void Function()? onReset;

  const CustomStepper({
    Key? key,
    required this.onDecrease,
    required this.onIncrease,
    required this.onReset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 94,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  ElevatedButton(
                    child: null,
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: onIncrease,
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        CupertinoIcons.add,
                        size: 20,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            width: 1.5,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
              // color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  ElevatedButton(
                    child: null,
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: onReset,
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        CupertinoIcons.arrow_clockwise,
                        size: 20,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            width: 1.5,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
              // color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  ElevatedButton(
                    child: null,
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: onDecrease,
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        CupertinoIcons.minus,
                        size: 20,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
