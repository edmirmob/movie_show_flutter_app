
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';




void main() {

  group('Movie Repository', () {
    
    test('testing movie connection', () async {
      final url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=ab1f3efc065ae5c4c52e55a0a453601b';
      final res = await get(Uri.parse(url));
      
         expect( res.statusCode==200, true);
         expect( res.statusCode==400, false);
        

    });
  });



}