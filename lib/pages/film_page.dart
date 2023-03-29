import 'package:flutter/material.dart';

import '../models/film.dart';

class FilmPage extends StatelessWidget {
  final Film film;

  FilmPage({required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title ?? 'Unknown'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Episode: ${film.episodeId ?? 'Unknown'}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Director: ${film.director ?? 'Unknown'}',
                style: TextStyle(fontSize: 18),
              ),
              // SizedBox(height: 8),
              // Text(
              //   'Director: ${film['director'] ?? 'Unknown'}',
              //   style: TextStyle(fontSize: 18),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   'Producer: ${film['Producer'] ?? 'Unknown'}',
              //   style: TextStyle(fontSize: 18),
              // ),
               SizedBox(height: 8),
               Text(
                 'Release: ${film.date?? 'Unknown'}',
                 style: TextStyle(fontSize: 18),
               ),
              // SizedBox(height: 8),
              // Text(
              //   'Species: ${film['species'] ?? 'Unknown'}',
              //   style: TextStyle(fontSize: 18),
              // ),
              SizedBox(height: 8),
              Text(
              'Opening: ${film.openingCrawl ?? 'Unknown'}',
               style: TextStyle(fontSize: 18),
              ),
               SizedBox(height: 8),
               Text(
                 'Vehicles: ${film.vehicles ?? 'Unknown'}',
                style: TextStyle(fontSize: 18),
               ),
              // SizedBox(height: 8),
              // Text(
              //   'Characters: ${film['characters'] ?? 'Unknown'}',
              //   style: TextStyle(fontSize: 18),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   'Planets: ${film['planets'] ?? 'Unknown'}',
              //   style: TextStyle(fontSize: 18),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   'Url: ${film['url'] ?? 'Unknown'}',
              //   style: TextStyle(fontSize: 18),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   'Created: ${film['created'] ?? 'Unknown'}',
              //   style: TextStyle(fontSize: 18),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   'Edited: ${film['edited'] ?? 'Unknown'}',
              //   style: TextStyle(fontSize: 18),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
