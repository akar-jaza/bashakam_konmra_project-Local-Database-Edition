import 'package:bashakam_barawzanko/Providers/font_provider.dart';
import 'package:bashakam_barawzanko/constants/constants.dart';
import 'package:flutter/material.dart';

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
    String getFont = FontProvider.defaultFont;

    if (index.isOdd) {
      return Divider(
        color: Theme.of(context).colorScheme.outlineVariant,
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
          style: TextStyle(
            color: Theme.of(context).colorScheme.onTertiaryContainer,
            fontSize: Constants.kamtrinKonmraTitleFontSize(getFont),
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
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: getFont != "uniQaidar" ? 13.5 : 15,
                // letterSpacing: 0.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'گشتی: ($gZankoline) - ($gParallel) - ($gEwaranText)',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: getFont != "uniQaidar" ? 13.5 : 15,
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
