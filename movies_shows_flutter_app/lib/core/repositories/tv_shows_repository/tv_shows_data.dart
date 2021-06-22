import 'package:flutter/material.dart';

import '../../models/tv_show.dart';

class TvShowData {
  final List<Result> tvShow;

  TvShowData({
    @required this.tvShow,
  });
}

class InitialTvShowData extends TvShowData {
  InitialTvShowData()
      : super(
          tvShow: [],
        );
}

class LoadingTvShowData extends TvShowData {
  LoadingTvShowData({
    @required List<Result> tvShow,
  }) : super(tvShow: tvShow);
}
