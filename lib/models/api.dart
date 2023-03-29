import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test3/models/film.dart';

class Api {
  static const String _baseUrl = 'https://swapi.dev/api';

  static Future<List<dynamic>> getCharacters() async {
    final response = await http.get(Uri.parse('$_baseUrl/people/'));
    print(response);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final count = data['count'];
      final pageCount = (count / data['results'].length).ceil();
      final characters = <dynamic>[];
      for (var i = 1; i <= pageCount; i++) {
        final response = await http.get(Uri.parse('$_baseUrl/people/?page=$i'));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          characters.addAll(data['results']);
        } else {
          throw Exception('Failed to load characters');
        }
      }
      return characters;
    } else {
      throw Exception('Failed to load characters');
    }
  }

  static Future<List<Film>> getFilms() async {
    final response = await http.get(Uri.parse('$_baseUrl/films/'));
    print(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final count = data['count'];
      final pageCount = (count / data['results'].length).ceil();
      final films = <Film>[];
      for (var i = 1; i <= pageCount; i++) {

        final response = await http.get(Uri.parse('$_baseUrl/films/?page=$i'));
        if (response.statusCode == 200) {
          final List data = json.decode(response.body)['results'];
          print('fdsaff $data');

          for (int index = 0; index < data.length; index++) {
            print('fdsaf');
            films.add(Film.fromJson(data[index]));
            print('fdsaf 2');
          }
        } else {
          throw Exception('Failed to load films');
        }
      }
      print('fdsaff 2 $data');
      return films;
    } else {
      throw Exception('Failed to load films');
    }
  }
}

//Метод getCharacters и getFilms выполняет GET-запрос к API для получения списка персонажей и фильмов
// Star Wars, указывая номер страницы в запросе. По умолчанию, если параметр
// page не указан, он будет равен 1. Метод разбирает ответ в формате
// JSON и возвращает список результатов из поля results в ответе.
