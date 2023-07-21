import 'package:flutter/material.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';

import '../Models/department_data.dart';

class SlemaniKonmraListItem extends StatelessWidget {
  final List<DepartmentData> departments; // Update the data type here
  final int index;

  const SlemaniKonmraListItem({
    Key? key, // Add the missing Key parameter
    required this.departments,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index.isOdd) {
      // Odd index represents the divider
      return const Divider(
        color: Color.fromARGB(72, 197, 198, 209),
      );
    } else {
      final itemIndex = index ~/ 2;

      if (itemIndex >= departments.length) {
        // Return an empty SizedBox
        return const SizedBox.shrink();
      }
      final DepartmentData departmentData = departments[itemIndex];
      return ListTile(
        title: Text(
          departmentData.departmentName,
          style: const TextStyle(
            color: ThemeColors.kWhiteTextColor,
          ),
          textAlign: TextAlign.center,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(
              'پارێزگا: ${departmentData.parezga}',
              style: const TextStyle(color: ThemeColors.kWhiteTextColor),
            ),
            Text(
              'گشتی: ${departmentData.gshty}',
              style: const TextStyle(color: ThemeColors.kWhiteTextColor),
            ),
          ],
        ),
      );
    }
  }
}
