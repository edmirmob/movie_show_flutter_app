import 'package:flutter/material.dart';

import '../../models/movie.dart';

class MoviesData {
  final List<Result> movies;

  MoviesData({
    @required this.movies,
  });
}

class InitialMoviesData extends MoviesData {
  InitialMoviesData()
      : super(
          movies: [],
        );
}

class LoadingMoviesData extends MoviesData {
  LoadingMoviesData({
    @required List<Result> movies,
  }) : super(movies: movies);
}
