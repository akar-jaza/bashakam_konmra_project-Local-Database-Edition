// ignore_for_file: avoid_print

import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart'; // Import the csv package

class ImportDepartmentIntroduction {
  ImportDepartmentIntroduction(String s);

  // Add the importDataFromCsv function here
  static Future<List<Map<String, dynamic>>> importDataFromCsv(String s) async {
    try {
      final String csvData =
          await rootBundle.loadString(s); // Pass the file path parameter
      final List<List<dynamic>> csvTable =
          const CsvToListConverter().convert(csvData);

      List<Map<String, dynamic>> data = [];

      for (int i = 0; i < csvTable.length; i++) {
        // Skip the header row (index 0), start from index 1
        Map<String, dynamic> rowData = {
          'departmentName': csvTable[i][0].toString(),
          'introduction': csvTable[i][1].toString(),
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
