import 'package:bashakam_barawzanko/csv_importers/fetch_konmra_cities/import_konmra_csv.dart';

class dataRepository {
  Future<List<Map<String, dynamic>>> fetchData() async {
    List<Map<String, dynamic>> konmra = await ImportKonmraCsv.importDataFromCsv(
        'assets/data/CSV(2021-2022).csv');

    return konmra;
  }

  List<Map<String, dynamic>> filterData(
      List<Map<String, dynamic>> data, String enteredKeyword) {
    List<Map<String, dynamic>> filteredList = data.where((data) {
      final departmentName = data['department'] as String;
      final pZankoline = data['p_zankoline'] as String;
      final pParallel = data['p_parallel'] as String;
      final pEwaran = data['p_ewaran'] as String;
      final gZankoline = data['g_zankoline'] as String;
      final gParallel = data['g_parallel'] as String;
      final gEwaran = data['g_ewaran'] as String;

      return departmentName.contains(enteredKeyword) ||
          pZankoline.contains(enteredKeyword) ||
          pParallel.contains(enteredKeyword) ||
          pEwaran.contains(enteredKeyword) ||
          gZankoline.contains(enteredKeyword) ||
          gParallel.contains(enteredKeyword) ||
          gEwaran.contains(enteredKeyword);
    }).toList();

    return filteredList;
  }
}
