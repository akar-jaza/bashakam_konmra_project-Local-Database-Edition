import 'dart:io';

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
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'باری ڕووناکی',
              style: TextStyle(
                color: ThemeColors.kBodyTextColor,
                fontSize: 16,
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
                        fontSize: 14,
                      ),
                    ),
                  );
                }).toList(),
                iconSize: 25,
                iconEnabledColor: ThemeColors.kLightGreyTextColor,
                underline: const SizedBox(),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'زیاتر',
              style: TextStyle(
                color: ThemeColors.kblueColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 25),
            SettingCard(
              title: 'دەربارەی بەشەکەم',
              subTitle: 'بۆچی ئەپڵیکەیشنی بەشەکەمم درووست کرد؟',
              onTap: () {},
            ),
            const SizedBox(height: 30),
            SettingCard(
              title: 'پەیوەندی',
              subTitle: 'پەیوەندی بە گەشەپێدەرەوە بکە ',
              onTap: () {},
            ),
            const SizedBox(height: 30),
             SettingCard(
              title: 'هاوبەشی بکە',
              subTitle: 'لەگەڵ هاوپۆل و هاوڕێکانت هاوبەشی پێبکە',
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  const SettingCard({
    required this.title,
    required this.subTitle,
    required this.onTap,
    super.key,
  });
  final String title;
  final String subTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStatePropertyAll(
        ThemeColors.kblueColor.withOpacity(0.2),
      ),
      highlightColor: Platform.isIOS
          ? Colors.transparent
          : ThemeColors.kblueColor.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: ThemeColors.kBodyTextColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subTitle,
            style: const TextStyle(
              color: ThemeColors.kLightGreyTextColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
