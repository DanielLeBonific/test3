import 'package:flutter/material.dart';
import 'package:test3/models/character_list.dart';
import 'package:test3/models/film_list.dart';


class TabBarViewWidget extends StatefulWidget {
  @override
  _TabBarViewWidgetState createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget> {
  final List<Tab> _tabs = [
    Tab(text: 'Character'),
    Tab(text: 'Film'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('SWAPI')),
          bottom: TabBar(
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          children: [
            CharacterList(),
            FilmList(),
          ],
        ),
      ),
    );
  }
}
