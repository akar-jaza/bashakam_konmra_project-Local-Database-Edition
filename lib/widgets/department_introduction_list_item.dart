import 'package:flutter/material.dart';
import '../constantes/them_colors.dart';

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
    double calculateTextFontSize(BuildContext context) {
      final screenSize = MediaQuery.of(context).size;
      final screenWidth = screenSize.width;

      if (screenWidth < 375) {
        return 13; // Small screen
      } else if (screenWidth < 600) {
        return 16; // Medium screen
      } else {
        return 18; // Large screen
      }
    }

    if (index.isOdd) {
      return const Divider(
        color: Color.fromARGB(72, 197, 198, 209),
      );
    } else {
      final itemIndex = index ~/ 2;

      if (itemIndex >= departments.length) {
        return const SizedBox.shrink();
      }
      final departmentData = departments[index];
      final departmentName = departmentData['departmentName'];

      return Directionality(
        textDirection: TextDirection.rtl,
        child: Expanded(
          child: Column(
            children: [
              ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding:
                    const EdgeInsets.only(right: 20, top: 5, bottom: 5),
                leading: SizedBox(
                  width: 250,
                  child: Text(
                    departmentName,
                    style: TextStyle(
                      color: ThemeColors.kWhiteTextColor,
                      fontSize: calculateTextFontSize(context),
                      letterSpacing: 0.0,
                      height: 1.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
