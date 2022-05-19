// To parse this JSON data, do
//
//     final movieResponse = movieResponseFromMap(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';
import '../clases/movie.dart';

class MovieResponse {
  MovieResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  Dates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory MovieResponse.fromJson(String str) =>
      MovieResponse.fromMap(json.decode(str));

  factory MovieResponse.fromMap(Map<String, dynamic> json) => MovieResponse(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );
}
