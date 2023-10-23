import 'dart:io';
import 'package:flutter/material.dart';

Future<void> filterByCityModalBottomSheet(
    BuildContext context,
    bool slemaniIsChecked,
    bool hawlerIsChecked,
    bool duhokIsChecked,
    void Function(String) runFilter) {
  return showModalBottomSheet<void>(
    backgroundColor: Theme.of(context).colorScheme.surface,
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "گەڕان بەپێی شار",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.surface,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      title: Text(
                        "سلێمانی",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
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
                      activeColor: Theme.of(context).colorScheme.onSecondary,
                      checkColor: Theme.of(context).colorScheme.onPrimary,
                      side: slemaniIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                width: 1.0,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    CheckboxListTile(
                      title: Text(
                        "هەولێر",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
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
                      activeColor: Theme.of(context).colorScheme.onSecondary,
                      checkColor: Theme.of(context).colorScheme.onPrimary,
                      side: hawlerIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                width: 1.0,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    CheckboxListTile(
                      title: Text(
                        "دهۆک",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
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
                      activeColor: Theme.of(context).colorScheme.onSecondary,
                      checkColor: Theme.of(context).colorScheme.onPrimary,
                      side: duhokIsChecked
                          ? null
                          : MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                width: 1.0,
                                color: Theme.of(context).colorScheme.surface,
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
