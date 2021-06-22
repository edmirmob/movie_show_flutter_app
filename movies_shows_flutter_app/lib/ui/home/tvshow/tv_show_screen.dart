import 'package:flutter/material.dart';

import '../../../core/models/tv_show.dart';
import '../../../core/repositories/tv_shows_repository/tv_shows_controller.dart';
import '../../../locator.dart';
import '../listview_details.dart';

class TvShowStreamBuilder extends StatefulWidget {
  TvShowStreamBuilder({Key key}) : super(key: key);

  @override
  _TvShowStreamBuilderState createState() => _TvShowStreamBuilderState();
}

class _TvShowStreamBuilderState extends State<TvShowStreamBuilder> {
  final _tvShowController = locator.get<TvShowController>();
  @override
  void initState() {
    super.initState();

    _tvShowController.loadTvShow();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Result>>(
        stream: _tvShowController.tvShowData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            CircularProgressIndicator();
          }
          if (snapshot.hasData) return listDataTvShow(snapshot.data, context);
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget tvShowImage(String imageUrl) {
    return Container(
        width: 70,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          shape: BoxShape.rectangle,
          image: DecorationImage(
              // image: AssetImage('asset/images/profile.png'),
              image: NetworkImage(imageUrl) ?? Icon(Icons.no_photography),
              fit: BoxFit.cover),
        ));
  }

  Widget listDataTvShow(List<Result> data, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: data.length.clamp(0, 10),
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
                    img != '' ? tvShowImage('$url/$dime$img') : Container(),
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
                                    data[index]?.name,
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
                                                title: data[index]?.name,
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
