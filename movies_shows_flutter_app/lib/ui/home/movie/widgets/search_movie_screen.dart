import 'package:flutter/material.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/repositories/movie_repository/search_movie_controller.dart';
import '../../../../locator.dart';
import '../../../../shared/search_field.dart';
import '../../listview_details.dart';

class SearchMovieScreen extends StatefulWidget {
  static const route = '/search-screen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchMovieScreen> {
  final _searchMovieController = locator.get<SearchMoviesController>();

  TextStyle mainTextStyle() {
    return TextStyle(fontSize: 15, color: Colors.grey);
  }

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context).settings.arguments as String;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: SearchField(
                      initialValue: routeData.toString(),
                      hint: 'Search',
                      onChanged: (value) {
                        if (value.length > 2)
                          _searchMovieController.searchMovies(value);
                        if (value.length < 3) {
                          Navigator.pop(context);
                        }
                      }),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text('Cancel'),
                    )),
              ],
            ),
          ),
          Divider(
            height: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: StreamBuilder<List<Result>>(
                stream: _searchMovieController.searchData,
                builder: (context, snapshot) {
                  // ignore: unnecessary_null_comparison

                  if (snapshot.hasData)
                    return listDataMovie(snapshot?.data, context);
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ],
      )),
    );
  }

  Widget movieImage(String imageUrl) {
    return imageUrl != ''
        ? Container(
            width: 70,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  // image: AssetImage('asset/images/profile.png'),
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover),
            ))
        : Container();
  }

  Widget listDataMovie(List data, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: data.length != null ? data.length.clamp(0, 10) : 0,
        itemBuilder: (context, index) {
          var url = 'https://image.tmdb.org/t/p';
          var dime = 'w500';
          var img = data[index].posterPath;

          return data.length == null
              ? Center(
                  child: Image.asset('assets/images/empty.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width),
                )
              : Card(
                  color: Colors.white,
                  elevation: 0,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          img != ''
                              ? movieImage('$url/$dime$img')
                              : Center(
                                  child: Image.asset(
                                  'assets/images/empty.png',
                                  fit: BoxFit.cover,
                                  width: 70,
                                  height: 80,
                                )),
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
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              data[index].title,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
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
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                '${data[index].overview}',
                                                style: mainTextStyle(),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                  return ListViewDetails(
                                                      overview:
                                                          data[index].overview,
                                                      title: data[index].title,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
