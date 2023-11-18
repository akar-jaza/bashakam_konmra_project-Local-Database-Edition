import 'package:bashakam_barawzanko/Providers/font_provider.dart';
import 'package:bashakam_barawzanko/Providers/font_size_controller.dart';
import 'package:bashakam_barawzanko/Providers/theme_provider.dart';
import 'package:bashakam_barawzanko/color/theme_colors.dart';
import 'package:bashakam_barawzanko/csv_importers/fetch_konmra_cities/import_duhok_konmra_csv.dart';
import 'package:bashakam_barawzanko/csv_importers/fetch_konmra_cities/import_hawler_konmra_csv.dart';
import 'package:bashakam_barawzanko/csv_importers/fetch_konmra_cities/import_slemani_konmra_csv.dart';
import 'package:bashakam_barawzanko/csv_importers/import_department_introduction_csv.dart';
import 'package:bashakam_barawzanko/helpers/system_ui_overlay_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/main_page.dart';
import 'csv_importers/fetch_konmra_cities/import_konmra_csv.dart';

// Note: Handling RTL Layout for Kurdish (ku) Locale
// -------------------------------------------------
// This section addresses the RTL layout for the Kurdish (ku) locale.
// Since the Flutter team doesn't natively support Kurdish, the "ku" locale
// might trigger a warning. We use Farsi (ar) locale settings to fix this issue.

// Important: This app is Kurdish, not arabic. Arabic is used for proper RTL support.
// -------------------------------------------------

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox('slemaniKonmra');
  await Hive.openBox('hawlerKonmra');
  await Hive.openBox('duhokKonmra');

  await Hive.openBox('departmentIntroduction');

  await ImportSlemaniKonmraCsv.importDataFromCsv(
      'assets/data/2022_2023/slemani_2022_2023.csv');
  await ImportHawlerKonmraCsv.importDataFromCsv(
      'assets/data/2022_2023/hawler_2022_2023.csv');
  await ImportDuhokKonmraCsv.importDataFromCsv(
      'assets/data/2022_2023/duhok_2022_2023.csv');

  await ImportKonmraCsv.importDataFromCsv('assets/data/CSV(2021-2022).csv');
  await ImportDepartmentIntroduction.importDataFromCsv(
      'assets/data/bashakan_info(CSV).csv');

  await Locales.init(['ar']);

  final systemUiOverlayHelper = SystemUiOverlayHelper();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final isDark = sharedPreferences.getBool('_isDark') ?? false;
  final getFont = sharedPreferences.getString('selectedFont') ?? "uniQaidar";

  isDark
      ? systemUiOverlayHelper.setDarkModeSystemUiOverlayStyle()
      : systemUiOverlayHelper.setLightModeSystemUiOverlayStyle();

  runApp(MyApp(isDark: isDark, getFont: getFont));
}

class MyApp extends StatefulWidget {
  final bool isDark;
  final String getFont;
  const MyApp({
    super.key,
    required this.isDark,
    required this.getFont,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return ThemeProvider(isDark: widget.isDark);
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return FontProvider(widget.getFont);
          },
        ),
        ChangeNotifierProvider(create: (BuildContext context) {
          return FontProvider(widget.getFont);
        }),
        ChangeNotifierProvider(
          create: (_) => FontSizeController(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (BuildContext context) {
          return ThemeProvider(isDark: widget.isDark);
        },
        child: Builder(builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return LocaleBuilder(
            builder: (local) {
              return TooltipVisibility(
                visible: false,
                child: Theme(
                  data: ThemeData(
                    pageTransitionsTheme:
                        Theme.of(context).pageTransitionsTheme,
                  ),
                  child: MaterialApp(
                    localizationsDelegates: Locales.delegates,
                    supportedLocales: Locales.supportedLocales,
                    locale: local,
                    debugShowCheckedModeBanner: false,
                    themeMode: themeProvider.themeMode,
                    theme: MyThemes().lightTheme(context),
                    darkTheme: MyThemes().darkTheme(context),
                    home: const MainPage(),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
