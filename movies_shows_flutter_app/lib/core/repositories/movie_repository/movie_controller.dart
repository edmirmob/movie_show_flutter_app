import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';
import '../../models/movie.dart';
import '../../models/paged_data.dart';
import 'movieRepository.dart';
import 'movies_data.dart';

class MoviesController {
  final _moviesControl = locator.get<MovieRepository>();
  final _moviesController =
      BehaviorSubject<MoviesData>.seeded(InitialMoviesData());

  Future<PagedData<Result>> loadMovies() async {
    final state = InitialMoviesData();
    _moviesController.add(LoadingMoviesData(movies: state.movies));
    final result = await _getMovies();
    _moviesController.add(LoadingMoviesData(movies: [...result.items]));

    return PagedData([...result.items], result.totalCount);
  }

  Future<PagedData<Result>> _getMovies() async {
    return _moviesControl.getMovies(1, 10);
  }

  StreamSubscription _filterSubscription;

  Stream<MoviesData> get moviesData {
    return _moviesController.stream;
  }
}
