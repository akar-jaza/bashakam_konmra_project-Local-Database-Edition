import 'package:bashakam_barawzanko/Providers/font_provider.dart';
import 'package:bashakam_barawzanko/components/my_cupertino_appbar.dart';
import 'package:flutter/material.dart';

//! 3
//* لە دوای ئەوەی یوزەر کلیکی لەسەر هەر بەشێک کرد، ئەم کڵاسە زانیاری بەش پیشان دەداتەوە
//* 
//* 

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
    String getFont = FontProvider.defaultFont;

    return Scaffold(
      appBar: MyCupertinoAppBar(
        enableLeading: true,
        middleText: departmentName,
        isMiddleTextBlue: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              introduction,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
                fontSize: getFont != "uniQaidar" ? 14 : 16,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        heroTag: null,
      ),
    );
  }
}
