import '../../../common/http.dart';
import '../../models/movie.dart';
import '../../models/paged_data.dart';

class MovieRepository with Http {
  String apiKey = 'ab1f3efc065ae5c4c52e55a0a453601b';
  Future<PagedData<Result>> getMovies(int page, int pageSize) {
    return get(
      Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey'),
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

  Future<List<Result>> searchMovies(
    String search,
  ) {
    return get(
      Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=ab1f3efc065ae5c4c52e55a0a453601b&language=en-US&query=$search&page=1&include_adult=false'),
    ).then(
      (result) {
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
