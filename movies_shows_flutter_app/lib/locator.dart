import 'package:get_it/get_it.dart';

import 'core/repositories/movie_repository/movieRepository.dart';
import 'core/repositories/movie_repository/movie_controller.dart';
import 'core/repositories/movie_repository/search_movie_controller.dart';
import 'core/repositories/tv_shows_repository/search_tv_show_controller.dart';
import 'core/repositories/tv_shows_repository/tv_show_repository.dart';
import 'core/repositories/tv_shows_repository/tv_shows_controller.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerSingleton<MovieRepository>(MovieRepository());

  locator.registerSingleton<SearchMoviesController>(SearchMoviesController());

  locator.registerSingleton<MoviesController>(MoviesController());

  locator.registerSingleton<TvShowRepository>(TvShowRepository());

  locator.registerSingleton<TvShowController>(TvShowController());

  locator.registerSingleton<SearchTvShowController>(SearchTvShowController());
}
