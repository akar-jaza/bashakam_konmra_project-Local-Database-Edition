import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:bashakam_barawzanko/csv_importers/import_department_introduction_csv.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'Screens/home_page.dart';
import 'csv_importers/import_konmra_csv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('konmra');
  await Hive.openBox('departmentIntroduction');
  await ImportKonmraCsv.importDataFromCsv('assets/data/CSV(2021-2022).csv');
  await ImportDepartmentIntroduction.importDataFromCsv(
      'assets/data/bashakan_info(CSV).csv');
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
