import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'بەپێی سیستەم',
      'دۆخی ڕووناک',
      'دۆخی تاریک',
    ];
    String? selectedItem = 'بەپێی سیستەم';

    return Scaffold(
      backgroundColor: ThemeColors.kBodyColor,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [
            const Text(
              'ڕووکار',
              style: TextStyle(
                color: ThemeColors.kblueColor,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'باری ڕووناکی',
              style: TextStyle(
                color: ThemeColors.kBodyTextColor,
                fontSize: 17,
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: ThemeColors.kMyCardColor,
              ),
              child: DropdownButton<String>(
                value: selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedItem = newValue;
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: ThemeColors.kLightGreyTextColor,
                        fontSize: 15,
                      ),
                    ),
                  );
                }).toList(),
                iconSize: 30,
                iconEnabledColor: ThemeColors.kLightGreyTextColor,
                underline: const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
