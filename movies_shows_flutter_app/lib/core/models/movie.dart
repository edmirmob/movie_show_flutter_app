// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'package:intl/intl.dart';

class Movie {
  Movie({
    this.page,
    this.data,
    this.totalPages,
    this.totaldata,
  });

  final int page;
  final List<Result> data;
  final int totalPages;
  final int totaldata;

//     factory Movie.fromJson(Map<String, dynamic> json) => Movie(
//         page: json["page"],
//         data: List<Result>.from(json["data"].map((x) => Result.fromJson(x))),
//         totalPages: json["total_pages"],
//         totaldata: json["total_data"],
//     );

//     Map<String, dynamic> toJson() => {
//         "page": page,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "total_pages": totalPages,
//         "total_data": totaldata,
//     };
// }
}

class Result {
  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
   // this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
//  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;


static Result fromMap(Map<String, dynamic> data) {
    return Result(
      adult: data['adult'] != null ? data['adult'] : false,
      backdropPath: data['backdrop_path'] != null ? data['backdrop_path'] : '',
      genreIds: data['genreIds'] != null ? data['genreIds'] : [],
      id: data['id'] != null ? data['id'] : 0,
      originalLanguage:
          data['original_language'] != null ? data['original_language'] : '',
      originalTitle:
          data['original_title'] != null ? data['original_title'] : '',
      overview: data['overview'] != null ? data['overview'] : '',
      popularity: data['popularity'] != null ? data['popularity'] : 0.0,
      posterPath: data['poster_path'] != null ? data['poster_path'] : '',
      // releaseDate: (data['release_date']) != null
      //     ? DateFormat("yyyy-MM-dd").parse(data['release_date'].toString())
      //     : DateTime.now(),
      title: data['title'] != null ? data['title'] : '',
      video: data['video'] != null ? data['video'] : false,
      voteAverage: data['vote_average'].toDouble(),
      voteCount: data['vote_count'] != null ? data['vote_count'] : 0,
    );
  }
  // factory Result.fromJson(Map<String, dynamic> json) => Result(
  //     adult: json["adult"],
  //     backdropPath: json["backdrop_path"],
  //     genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
  //     id: json["id"],
  //     originalLanguage: json["original_language"],
  //     originalTitle: json["original_title"],
  //     overview: json["overview"],
  //     popularity: json["popularity"].toDouble(),
  //     posterPath: json["poster_path"],
  //     releaseDate: DateTime.parse(json["release_date"]),
  //     title: json["title"],
  //     video: json["video"],
  //     voteAverage: json["vote_average"].toDouble(),
  //     voteCount: json["vote_count"],
  // );

  // Map<String, dynamic> toJson() => {
  //     "adult": adult,
  //     "backdrop_path": backdropPath,
  //     "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
  //     "id": id,
  //     "original_language": originalLanguage,
  //     "original_title": originalTitle,
  //     "overview": overview,
  //     "popularity": popularity,
  //     "poster_path": posterPath,
  //     "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
  //     "title": title,
  //     "video": video,
  //     "vote_average": voteAverage,
  //     "vote_count": voteCount,
  // };
}
