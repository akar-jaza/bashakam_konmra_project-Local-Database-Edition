import 'dart:io';

import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/material.dart';

Future<void> filterByCityModalBottomSheet(
    BuildContext context,
    bool slemaniIsChecked,
    bool hawlerIsChecked,
    bool duhokIsChecked,
    void Function(String) runFilter) {
  return showModalBottomSheet<void>(
    backgroundColor: ThemeColors.kMyCardColor,
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: ThemeData(useMaterial3: true),
        child: StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return SizedBox(
              height: 260,
              child: Theme(
                data: ThemeData(
                  splashColor: Platform.isIOS ? Colors.transparent : null,
                  highlightColor: Platform.isIOS ? Colors.transparent : null,
                  fontFamily: "rabarBold",
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "گەڕان بەپێی شار",
                          style: TextStyle(
                              color: ThemeColors.kBodyTextColor, fontSize: 16),
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "سلێمانی",
                        style: TextStyle(
                          color: ThemeColors.kBodyTextColor,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: slemaniIsChecked,
                      onChanged: ((value) {
                        setState(() {
                          slemaniIsChecked = value!;
                          runFilter('');
                        });
                      }),
                      activeColor: ThemeColors.kblueColor,
                      checkColor: ThemeColors.kBodyColor,
                      side: slemaniIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                                width: 1.0,
                                color: ThemeColors.kBodyTextColor,
                              ),
                            ),
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "هەولێر",
                        style: TextStyle(
                          color: ThemeColors.kBodyTextColor,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: hawlerIsChecked,
                      onChanged: ((value) {
                        setState(() {
                          hawlerIsChecked = value!;
                          runFilter('');
                        });
                      }),
                      activeColor: ThemeColors.kblueColor,
                      checkColor: ThemeColors.kBodyColor,
                      side: hawlerIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                                width: 1.0,
                                color: ThemeColors.kBodyTextColor,
                              ),
                            ),
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "دهۆک",
                        style: TextStyle(
                          color: ThemeColors.kBodyTextColor,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: duhokIsChecked,
                      onChanged: ((value) {
                        setState(() {
                          duhokIsChecked = value!;
                          runFilter('');
                        });
                      }),
                      activeColor: ThemeColors.kblueColor,
                      checkColor: ThemeColors.kBodyColor,
                      side: duhokIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                                width: 1.0,
                                color: ThemeColors.kBodyTextColor,
                              ),
                            ),
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
