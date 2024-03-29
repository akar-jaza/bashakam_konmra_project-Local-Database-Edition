import 'dart:io';

import 'package:bashakam_barawzanko/Providers/font_provider.dart';
import 'package:bashakam_barawzanko/Screens/department_introduction/Department_info_screen.dart';
import 'package:bashakam_barawzanko/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//! 2
//* ئەم لیست ڤیو بیوڵدەرە بریتیە لە لیشتی هەموو بەشەکان
//* یوزەر کاتێک کلیک لە ئایتمی لیستێک دەکات دەڕوات بۆ زانیاری لەسەر ئەو بەشە
//*

class DepartmentIntroductionListItem extends StatelessWidget {
  final List<Map<String, dynamic>> departments;
  final int index;

  const DepartmentIntroductionListItem({
    Key? key,
    required this.departments,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getFont = Provider.of<FontProvider>(context, listen: true).getFont;

    if (index.isOdd) {
      return Divider(
        color: Theme.of(context).colorScheme.outlineVariant,
      );
    } else {
      final itemIndex = index ~/ 2;

      if (itemIndex >= departments.length) {
        return const SizedBox.shrink();
      }
      final departmentData = departments[index];
      final departmentName = departmentData['departmentName'];

      return Column(
        children: [
          Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
            ),
            child: ListTile(
              onTap: () {
                if (Platform.isIOS) {
                  Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (context) => DepartmentInfoScreen(
                        departmentName: departmentName,
                        introduction: departments[index]['introduction'],
                      ),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DepartmentInfoScreen(
                        departmentName: departmentName,
                        introduction: departments[index]['introduction'],
                      ),
                    ),
                  );
                }
              },
              visualDensity: VisualDensity.compact,
              contentPadding:
                  const EdgeInsets.only(right: 20, top: 5, bottom: 5),
              leading: SizedBox(
                width: 250,
                child: Text(
                  departmentName,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: Constants.departmentTitleFontSize(getFont),
                    letterSpacing: 0.0,
                    height: 1.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5.0),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 14,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
