import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';
import '../../models/paged_data.dart';
import '../../models/tv_show.dart';
import 'tv_show_repository.dart';
import 'tv_shows_data.dart';

class TvShowController {
  final _tvShowControl = locator.get<TvShowRepository>();
  final _tvShowController =
      BehaviorSubject<List<Result>>.seeded(InitialTvShowData().tvShow);

  Future<List<Result>> loadTvShow() async {
    final state = InitialTvShowData();
    _tvShowController.add(LoadingTvShowData(tvShow: state.tvShow).tvShow);
    final result = await _getTvShow();

    _tvShowController.add(LoadingTvShowData(tvShow: [...result.items]).tvShow);

    return result.items;
  }

  Future<PagedData<Result>> _getTvShow() {
    return _tvShowControl.getTvShow();
  }

  StreamSubscription _filterSubscription;

  Stream<List<Result>> get tvShowData {
    return _tvShowController.stream;
  }
}
