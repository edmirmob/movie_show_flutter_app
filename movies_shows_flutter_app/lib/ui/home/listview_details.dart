import 'package:flutter/material.dart';



class ListViewDetails extends StatelessWidget {
  ListViewDetails({Key key, this.overview,this.title, this.image}) : super(key: key);

  
  final String overview;
  final String title;
  final String image;


  // final _moviesController = locator.get<MovieDetailsController>();
  // final _moviesControl = locator.get<MovieRepository>();
  // final MovieDetails movieDetails = MovieDetails();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        centerTitle: true,
        
      ),
      body: ListView(
        children: [
          Image.network(image, height: 250,fit: BoxFit.fill,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                
                '${title.toString()}',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22, ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10,),
              Text(
                '${overview.toString()}',
                style: TextStyle(fontSize: 17, ),
              ),
              // Text.rich(
              //   TextSpan(
              //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              //       children: [
              //         TextSpan(text: '${movies.popularity} '),
              //         TextSpan(
              //           text: 'More...',
              //           style: TextStyle(color: Colors.indigoAccent),
              //         ),
              //       ]),
              // )
            ],
    ),
          ),
        ],
      )
    //          ListView(
    //           children: [
               
    //             // Text('Ovo je id : ${widget.id}'),
    //             Text('Ovo je title : ${widget.movies.id}'),
    //             Text('Ovo je title : ${widget.movies.title}'),
    //             Text('Ovo je overview : ${widget.movies.overview}'),
    //             // MovieDetailsThumbnail(
    //             //   thumbnail: movie.images[0],
    //             // ),
    //             // MovieDetailsHeaderWithPoster(movie: movie),
    //             // HorizontalLine(),
    //             // MovieDetailsCast(
    //             //   movie: movie,
    //             // ),
    //             // HorizontalLine(),
    //             // MovieDetailsExtraPosters(
    //             //   posters: movie.images,
    //             // )
    //           ],
    // ),
    );
    
  }
}
