// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>?> fetchData() async {
  const url =
      'https://a2ea-185-56-194-8.ngrok-free.app/Konmra_project/endpoints/2020-2021/fetch_all_cities.php';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData as Map<String, dynamic>;
    } else {
      throw Exception('Failed to fetch data');
    }
  } catch (e) {
    print('Connection failed: $e');
    return null;
  }
}
