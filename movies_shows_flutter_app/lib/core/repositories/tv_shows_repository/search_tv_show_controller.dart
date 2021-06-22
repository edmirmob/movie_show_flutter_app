import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';
import '../../models/tv_show.dart';
import 'tv_show_repository.dart';

class SearchTvShowController {
  final _tvShowControl = locator.get<TvShowRepository>();
  final _tvShowController = BehaviorSubject<List<Result>>.seeded([]);

  Future<List<Result>> _getTvShow(String search) async {
    return _tvShowControl.searchTvShows(search);
  }

  StreamSubscription _filterSubscription;

  Stream<List<Result>> get searchData {
    return _tvShowController.stream;
  }

  Future<void> searchTvShow(String search) async {
    Stream.fromFuture(
      _getTvShow(search),
    ).listen(
      (result) {
        _tvShowController.add([...result]);
      },
    );
  }
}
