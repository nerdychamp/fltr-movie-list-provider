import 'dart:math';

import 'package:flutter/foundation.dart';

import '../models/movie_model.dart';

final List<Movie> initialData = List.generate(
  50,
  (index) {
    return Movie(
      title: "Movie $index",
      duration: "${Random().nextInt(100) + 60} minutes",
    );
  },
);

class MovieProvider with ChangeNotifier {
  final List<Movie> _movie = initialData;
  final List<Movie> _myList = [];

  /* 
    getter
   */
  List<Movie> get movies => _movie;
  List<Movie> get myList => _myList;

  /* 
    actions
   */
  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
