import 'package:flutter/material.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';

class KonmraListItem extends StatelessWidget {
  final List<Map<String, dynamic>> departments;
  final int index;

  const KonmraListItem({
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
      final university = departmentData['university'];
      final collage = departmentData['collage_institute'];
      final department = departmentData['department'];

      final pZankoline = 'زانکۆڵاین: ${departmentData['p_zankoline']}';
      final pParallel = 'پاراڵێڵ: ${departmentData['p_parallel']}';
      final pEwaran = departmentData['p_ewaran'] ?? '';
      final hasNonWhitespaceCharacters = RegExp(r'\S').hasMatch(pEwaran);
      final pEwaranText = hasNonWhitespaceCharacters
          ? 'ئێواران: $pEwaran'
          : 'ئێواران: بەردەست نیە';

      final gZankoline = 'زانکۆڵاین: ${departmentData['g_zankoline']}';
      final gParallel = 'پاراڵێڵ: ${departmentData['g_parallel']}';
      final gEwaran = departmentData['g_ewaran'] ?? '';
      final hasNonWhitespaceCharactersIngEwaran =
          RegExp(r'\S').hasMatch(gEwaran);
      final gEwaranText = hasNonWhitespaceCharactersIngEwaran
          ? 'ئێواران: $pEwaran'
          : 'ئێواران: بەردەست نیە';

      return ListTile(
        title: Text(
          '${university ?? ''} / ${collage ?? ''} / ${department ?? ''}',
          style: const TextStyle(
            color: ThemeColors.kWhiteTextColor,
            fontSize: 19,
            // letterSpacing: 0.0,
          ),
          textAlign: TextAlign.center,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'پارێزگا: ($pZankoline) - ($pParallel) - ($pEwaranText)',
              style: const TextStyle(
                color: ThemeColors.kGreyTextColor,
                fontSize: 13.5,
                // letterSpacing: 0.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'گشتی: ($gZankoline) - ($gParallel) - ($gEwaranText)',
              style: const TextStyle(
                color: ThemeColors.kGreyTextColor,
                fontSize: 13.5,
                // letterSpacing: 0.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
  }
}
