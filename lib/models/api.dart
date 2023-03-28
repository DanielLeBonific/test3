import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String _baseUrl = 'https://swapi.dev/api';

  static Future<List<dynamic>> getCharacters({int page = 1}) async {
    final response = await http.get(Uri.parse('$_baseUrl/people/?page=$page'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load characters');
    }
  }

  static Future<List<dynamic>> getFilms({int page = 1}) async {
    final response = await http.get(Uri.parse('$_baseUrl/films/?page=$page'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load films');
    }
  }
}
