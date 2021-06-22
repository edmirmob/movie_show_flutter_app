import '../../../common/http.dart';
import '../../models/paged_data.dart';
import '../../models/tv_show.dart';

class TvShowRepository with Http {
  String apiKey = 'ab1f3efc065ae5c4c52e55a0a453601b';
  Future<PagedData<Result>> getTvShow() {
    return get(
      Uri.parse(
          'https://api.themoviedb.org/3/tv/top_rated?api_key=$apiKey&language=en-US&page=1'),
    ).then(
      (result) {
        var totalCount = result["total_results"] as int;
        var entities = result["results"] as List<dynamic>;
        var items = <Result>[];
        entities.forEach((entity) {
          items.add(Result.fromMap(entity));
        });

        return PagedData(items, totalCount);
      },
    );
  }

  Future<List<Result>> searchTvShows(
    String search,
  ) {
    return get(
      Uri.parse(
          'https://api.themoviedb.org/3/search/tv?api_key=ab1f3efc065ae5c4c52e55a0a453601b&language=en-US&query=$search&page=1&include_adult=false'),
    ).then(
      (result) {
        //   var totalCount = result["total_results"] as int;
        var entities = result["results"] as List<dynamic>;
        var items = <Result>[];
        entities.forEach((entity) {
          items.add(Result.fromMap(entity));
        });

        return items;
      },
    );
  }
}
