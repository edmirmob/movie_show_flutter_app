import 'package:flutter/material.dart';

import '../../../core/models/movie.dart';
import '../../../core/models/paged_data.dart';
import '../../../core/repositories/movie_repository/movie_controller.dart';
import '../../../locator.dart';
import '../listview_details.dart';

class MovieScreen extends StatefulWidget {
  @override
  _MovieStreamBuilderState createState() => _MovieStreamBuilderState();
}

class _MovieStreamBuilderState extends State<MovieScreen> {
  final _moviesController = locator.get<MoviesController>();

  @override
  void initState() {
    super.initState();
    _moviesController.loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PagedData<Result>>(
        future: _moviesController.loadMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            CircularProgressIndicator();
          }
          if (snapshot.hasData)
            return listDataMovie(snapshot.data.items, context);
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget movieImage(String imageUrl) {
    return Container(
        width: 70,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          shape: BoxShape.rectangle,
          image: DecorationImage(
              image: NetworkImage(imageUrl) ?? Icon(Icons.no_photography),
              fit: BoxFit.cover),
        ));
  }

  Widget listDataMovie(List<Result> data, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: data != null ? data.length : 0,
        itemBuilder: (context, index) {
          var url = 'https://image.tmdb.org/t/p';
          var dime = 'w500';
          var img = data[index]?.posterPath;

          return Card(
            color: Colors.white,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 5.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    img != '' ? movieImage('$url/$dime$img') : Container(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                Text(
                                  '${(index) + 1}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    data[index]?.title,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return ListViewDetails(
                                                overview: data[index]?.overview,
                                                title: data[index]?.title,
                                                image: '$url/$dime$img');
                                          }),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 17,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
