class Show {
  Show({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;
}

class Result {
  Result({
    // this.backdropPath,
    // this.firstAirDate,
    // this.genreIds,
    // this.id,
    this.name,
    // this.originCountry,
    // this.originalLanguage,
    // this.originalName,
    this.overview,
    // this.popularity,
    this.posterPath,
    // this.voteAverage,
    // this.voteCount,
  });

  // final String backdropPath;
  // final DateTime firstAirDate;
  // final List<int> genreIds;
  // final int id;
  final String name;
  // final List<OriginCountry> originCountry;
  // final OriginalLanguage originalLanguage;
  // final String originalName;
  final String overview;
  // final double popularity;
  final String posterPath;
  // final double voteAverage;
  // final int voteCount;

  // factory Result.fromJson(Map<String, dynamic> json) => Result(
  //     // backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
  //     // firstAirDate: DateTime.parse(json["first_air_date"]),
  //     // genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
  //     // id: json["id"],
  //     // name: json["name"],
  //     originCountry: List<OriginCountry>.from(json["origin_country"].map((x) => originCountryValues.map[x])),
  //     originalLanguage: originalLanguageValues.map[json["original_language"]],
  //     originalName: json["original_name"],
  //     overview: json["overview"],
  //     popularity: json["popularity"].toDouble(),
  //     posterPath: json["poster_path"],
  //     voteAverage: json["vote_average"].toDouble(),
  //     voteCount: json["vote_count"],
  //  );
  static Result fromMap(Map<String, dynamic> data) {
    return Result(
      // backdropPath: data['backdrop_path'] != null ? data['backdrop_path'] : '',
      // firstAirDate: (data['firstAirDate']) != null
      //     ? DateTime.parse(data['firstAirDate'])
      //     : DateTime.now(),
      // genreIds: data['genreIds'] != null ? data['genreIds'] : [],
      // id: data['id'] != null ? data['id'] : 0,
      name: data["name"] != null ? data['name'] : '',
      // originalLanguage:
      //     data['original_language'] != null ? data['original_language'] : '',
      // originalName: data['originalName'] != null ? data['originalName'] : '',
      overview: data['overview'] != null ? data['overview'] : '',
      // popularity: data['popularity'] != null ? data['popularity'] : 0.0,
      posterPath: data['poster_path'] != null ? data['poster_path'] : '',
      // voteAverage: data['vote_average'].toDouble(),
      // voteCount: data['vote_count'] != null ? data['vote_count'] : 0,
    );
  }

//   Map<String, dynamic> toJson() => {
//         "backdrop_path": backdropPath == null ? null : backdropPath,
//         "first_air_date":
//             "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
//         "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
//         "id": id,
//         "name": name,
//         "origin_country": List<dynamic>.from(
//             originCountry.map((x) => originCountryValues.reverse[x])),
//         "original_language": originalLanguageValues.reverse[originalLanguage],
//         "original_name": originalName,
//         "overview": overview,
//         "popularity": popularity,
//         "poster_path": posterPath,
//         "vote_average": voteAverage,
//         "vote_count": voteCount,
//       };
// }

// enum OriginCountry { GB, JP, KR, CN }

// final originCountryValues = EnumValues({
//   "CN": OriginCountry.CN,
//   "GB": OriginCountry.GB,
//   "JP": OriginCountry.JP,
//   "KR": OriginCountry.KR
// });

// enum OriginalLanguage { EN, JA, KO, ZH }

// final originalLanguageValues = EnumValues({
//   "en": OriginalLanguage.EN,
//   "ja": OriginalLanguage.JA,
//   "ko": OriginalLanguage.KO,
//   "zh": OriginalLanguage.ZH
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
}
