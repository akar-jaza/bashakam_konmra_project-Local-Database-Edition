// ignore_for_file: avoid_print

import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class ImportSlemaniKonmraCsv {
  static Future<List<Map<String, dynamic>>> importDataFromCsv(String s) async {
    try {
      final String csvData = await rootBundle.loadString(s);
      final List<List<dynamic>> csvTable =
          const CsvToListConverter().convert(csvData);

      List<Map<String, dynamic>> data = [];

      for (int i = 1; i < csvTable.length; i++) {
        // Skip the header row (index 0), start from index 1
        Map<String, dynamic> rowData = {
          'g_ewaran': csvTable[i][0].toString(),
          'p_ewaran': csvTable[i][1].toString(),
          'g_parallel': csvTable[i][2].toString(),
          'p_parallel': csvTable[i][3].toString(),
          'g_zankoline': csvTable[i][4].toString(),
          'p_zankoline': csvTable[i][5].toString(),
          'department': csvTable[i][6].toString(),
          'collage_institute': csvTable[i][7].toString(),
          'university': csvTable[i][8].toString(),
        };
        data.add(rowData);
      }

      return data;
    } catch (e) {
      print('Error reading CSV data: $e');
      return []; // Return an empty list in case of an error
    }
  }
}