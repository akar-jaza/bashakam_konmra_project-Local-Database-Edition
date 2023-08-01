import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'Screens/home_page.dart';
import 'helpers/hive_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('departments');
  await HiveHelper.importDataFromCsv('assets/data/CSV(2021-2022).csv');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'rabarBold',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ThemeColors.kblueColor,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            letterSpacing: 0.0,
          ),
          bodyMedium: TextStyle(
            letterSpacing: 0.0,
          ),
          labelLarge: TextStyle(
            letterSpacing: 0.0,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
