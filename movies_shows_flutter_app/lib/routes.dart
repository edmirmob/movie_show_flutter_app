import 'package:flutter/material.dart';

import 'ui/home/movie/widgets/search_movie_screen.dart';
import 'ui/home/tvshow/widgets/search_tv_show_screen.dart';

Map<String, WidgetBuilder> routes = {
  SearchMovieScreen.route: (_) => SearchMovieScreen(),
  SearchTvShowScreen.route: (_) => SearchTvShowScreen(),
};
