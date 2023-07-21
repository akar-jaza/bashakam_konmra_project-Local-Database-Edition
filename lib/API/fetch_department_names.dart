import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchData(currentPage, pageSize) async {
  const url = 'http://192.168.0.115/Konmra_project/';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return List<dynamic>.from(jsonData);
  } else {
    throw Exception('Failed to fetch data');
  }
}
