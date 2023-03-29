import 'package:flutter/material.dart';
import 'package:test3/models/api.dart';
import 'package:test3/pages/character_page.dart';

class CharacterList extends StatefulWidget {
  @override
  _characterListState createState() => _characterListState();
}

class _characterListState extends State<CharacterList> {
  List<dynamic> _characters = [];

  @override
  void initState() { // получение списка из API
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    try {
      final characters = await Api.getCharacters();
      setState(() {
        _characters.addAll(characters);
      });  //Если получение данных проходит успешно, то в переменную characters сохраняются данные,
      // а затем с помощью setState() обновляется значение _characters, которое содержит список персонажей,
      // и значение _isLoading устанавливается в false
    } catch (e) {
      setState(() {
      });
      print('Error loading characters: $e'); //Если получение данных из API не удалось по какой-то причине
      // то в блоке catch устанавливает
      // значение _isLoading в false, что означает что загрузка закончилась,
      // и выводится сообщение об ошибке в консоль
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // основной элемент пользовательского интерфейса,
      // который предоставляет структуру для построения страницы
      body: SafeArea( //гарантирует  что содержимое не будет перекрываться системными элементами,
        // такими как панель уведомлений или кнопки управления приложением
        child: Column(
          children: [
            Expanded( //растягивает своего родителя на всю доступную высоту экрана
              child: GridView.builder( //отвечает за отображение списка персонажей в виде сетки
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //для определения количества столбцов и соотношения высоты и ширины каждого элемента
                  crossAxisCount: 2,
                  childAspectRatio: 3/4,
                ),
                itemCount: _characters.length, //устанавливается равным количеству персонажей в списке _characters
                itemBuilder: (context, index) { //отвечает за построение каждого элемента в сетке
                  final character = _characters[index];
                  return GestureDetector( //при нажатии на карточку перенаправляет пользователя на страницу с
                    // передачей выбранного персонажа в качестве аргумента
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CharacterPage(character: character),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded( //занимает всю доступную высоту Card и содержит прямоугольный контейнер с серым фоном
                            child: Container(
                              color: Colors
                                  .grey[400], // заменить на цвет по умолчанию
                            ),
                          ),
                          Padding( //отвечает за отображение имени персонажа под прямоугольным контейнером
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              character['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
