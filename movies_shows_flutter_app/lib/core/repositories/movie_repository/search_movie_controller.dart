// import 'dart:async';

import 'dart:async';

import 'package:movies_shows_flutter_app/common/show_dialog.dart';
import 'package:movies_shows_flutter_app/core/models/movie.dart';
import 'package:movies_shows_flutter_app/core/repositories/movie_repository/movieRepository.dart';
import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';

class SearchMoviesController {
  final _moviesControl = locator.get<MovieRepository>();
  final _moviesController = BehaviorSubject<List<Result>>.seeded([]);

  void _onMovieLoadingError() {
    showAlertDialog(('Can\'t load announcements'),
        ('There was an error while loading announcements. Please try again later.'));
  }

  Future<List<Result>> _getMovies(String search) async {
    return _moviesControl.searchMovies(search);
  }

  Stream<List<Result>> get searchData {
    return _moviesController.stream;
  }

  Future<void> searchMovies(String search) async {
    try {
      Stream.fromFuture(
        _getMovies(search),
      ).listen(
        (result) {
          _moviesController.add([...result]);
        },
      );
    } catch (e) {
      _onMovieLoadingError();
    }
  }
}
