import 'package:flutter/material.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';

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
      final university = departmentData['university'] as String?;
      final collage = departmentData['collage_institute'] as String?;
      final department = departmentData['department'] as String?;
      return ListTile(
        title: Text(
          '${university ?? ''} / ${collage ?? ''} / ${department ?? ''}',
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
