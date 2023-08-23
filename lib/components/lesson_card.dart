import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({
    Key? key,
    this.verticalMargin,
    required this.color,
    required this.text,
    required this.lessonScore,
    this.onTap,
  }) : super(key: key);

  final double? verticalMargin;
  final String lessonScore;
  final Color color;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      height: 150,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ThemeColors.kMyCardColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                text,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: ThemeColors.kBodyTextColor,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  lessonScore,
                  style: const TextStyle(
                      color: ThemeColors.kblueColor, fontSize: 17),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: onTap,
                  child: const Text(
                    'گۆڕین',
                    style: TextStyle(
                        color: ThemeColors.kLightGreyTextColor, fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
