// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectodemo/models/movie_response.dart';

import '../clases/movie.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'd2f0a3c1b5a3c82def9936e213faba2f';
  final String _urlOrigen = 'api.themoviedb.org';
  final String _lenguaje = 'es-ES';

  List<Movie> displayMovie = [];

  MoviesProvider() {
    getDisplayMovies();
  }

  getDisplayMovies() async {
    var url = Uri.https(_urlOrigen, '3/movie/now_playing',
        {'api_key': _apiKey, 'lenguaje': _lenguaje, 'page': '1'});

    final response = await http.get(url);
    final movieresponse = MovieResponse.fromJson(response.body);

    displayMovie = movieresponse.results;
    notifyListeners();
  }
}
