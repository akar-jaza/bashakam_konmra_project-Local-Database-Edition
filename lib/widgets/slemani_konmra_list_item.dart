import 'package:flutter/material.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';

import '../Models/department_data.dart';

class SlemaniKonmraListItem extends StatelessWidget {
  final List<Map<String, dynamic>> departments;
  final int index;

  const SlemaniKonmraListItem({
    Key? key,
    required this.departments,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index.isOdd) {
      return const Divider(
        color: Color.fromARGB(72, 197, 198, 209),
      );
    } else {
      final itemIndex = index ~/ 2;

      if (itemIndex >= departments.length) {
        return const SizedBox.shrink();
      }
      final departmentData = departments[itemIndex];
      return ListTile(
        title: Text(
          departmentData['department'] as String,
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
              'پارێزگا: ${departmentData['p_zankoline']}',
              style: const TextStyle(color: ThemeColors.kWhiteTextColor),
            ),
            Text(
              'گشتی: ${departmentData['g_zankoline']}',
              style: const TextStyle(color: ThemeColors.kWhiteTextColor),
            ),
          ],
        ),
      );
    }
  }
}
