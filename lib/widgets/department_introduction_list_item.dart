import 'package:flutter/material.dart';

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
      final departmentName = departmentData['departmentName'];
      final introduction = departmentData['introduction'];
      // final department = departmentData['department'];

      // final pZankoline = 'زانکۆڵاین: ${departmentData['p_zankoline']}';
      // final pParallel = 'پاراڵێڵ: ${departmentData['p_parallel']}';
      // final pEwaran = departmentData['p_ewaran'] ?? '';
      // final hasNonWhitespaceCharacters = RegExp(r'\S').hasMatch(pEwaran);
      // final pEwaranText = hasNonWhitespaceCharacters
      //     ? 'ئێواران: $pEwaran'
      //     : 'ئێواران: بەردەست نیە';

      // final gZankoline = 'زانکۆڵاین: ${departmentData['g_zankoline']}';
      // final gParallel = 'پاراڵێڵ: ${departmentData['g_parallel']}';
      // final gEwaran = departmentData['g_ewaran'] ?? '';
      // final hasNonWhitespaceCharactersIngEwaran =
      //     RegExp(r'\S').hasMatch(gEwaran);
      // final gEwaranText = hasNonWhitespaceCharactersIngEwaran
      //     ? 'ئێواران: $pEwaran'
      //     : 'ئێواران: بەردەست نیە';

      return ListTile(
        trailing: Text(departmentName),
      );
    }
  }
}
