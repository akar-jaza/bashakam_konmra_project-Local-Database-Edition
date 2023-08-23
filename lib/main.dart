import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:bashakam_barawzanko/csv_importers/import_department_introduction_csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hive_flutter/adapters.dart';
import 'Screens/home_page.dart';
import 'csv_importers/import_konmra_csv.dart';

// Note: Handling RTL Layout for Kurdish (ku) Locale
// -------------------------------------------------
// This section addresses the RTL layout for the Kurdish (ku) locale.
// Since the Flutter team doesn't natively support Kurdish, the "ku" locale
// might trigger a warning. We use Farsi (fa) locale settings to fix this issue.

// Important: This app is Kurdish, not Farsi. Farsi is used for proper RTL support.
// -------------------------------------------------

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  // await Hive.openBox('konmra');
  await Hive.openBox('departmentIntroduction');
  await ImportKonmraCsv.importDataFromCsv('assets/data/CSV(2021-2022).csv');
  await ImportDepartmentIntroduction.importDataFromCsv(
      'assets/data/bashakan_info(CSV).csv');
  WidgetsFlutterBinding.ensureInitialized();

  await Locales.init(['fa']);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (local) => TooltipVisibility(
        visible: false,
        child: MaterialApp(
          localizationsDelegates: Locales.delegates,
          supportedLocales: Locales.supportedLocales,
          locale: local,
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
        ),
      ),
    );
  }
}
