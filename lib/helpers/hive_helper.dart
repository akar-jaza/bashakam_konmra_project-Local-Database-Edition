import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart'; // Import the csv package

class HiveHelper {
  // Add the importDataFromCsv function here
  static Future<List<Map<String, dynamic>>> importDataFromCsv(String s) async {
    try {
      final String csvData = await rootBundle.loadString(s); // Pass the file path parameter
      final List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvData);

      List<Map<String, dynamic>> data = [];

      for (int i = 1; i < csvTable.length; i++) {
        // Skip the header row (index 0), start from index 1
        Map<String, dynamic> rowData = {
          'g_ewaran': csvTable[i][0],
          'g_parallel': csvTable[i][1],
          'g_zankoline': csvTable[i][2],
          'p_ewaran': csvTable[i][3],
          'p_parallel': csvTable[i][4],
          'p_zankoline': csvTable[i][5],
          'department': csvTable[i][6],
          'collage-institute': csvTable[i][7],
          'university': csvTable[i][8],
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
