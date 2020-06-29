import 'package:flutter/material.dart';
import 'package:movie_app/src/models/detail_item_model.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetails extends StatelessWidget {
  Widget build(BuildContext context) {
    bloc.fetchMovieDetails();
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.movieDetails,
        builder: (context, AsyncSnapshot<DetailItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildDetails(snapshot, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  final index;
  final results;

  MovieDetails(
    this.index,
    this.results,
  );

  Widget buildDetails(AsyncSnapshot<DetailItemModel> snapshot, context) {
    var results = snapshot.data;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Hero(
                      child: Container(
                        height: 250,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${results.backdrop_path}',
                          fit: BoxFit.fill,
                        ),
                      ),
                      tag: 'card ${[index]}',
                    ),
                    Positioned(
                      top: 30,
                      child: IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      results.title,
                      maxLines: 1,
                      minFontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          results.budget.toString(),
                          style: GoogleFonts.montserrat(
                            color: Colors.grey,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          onPressed: () {},
                          color: Colors.black,
                          iconSize: 30,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${results.popularity.toStringAsFixed(0)} / 100',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Synopsis',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      results.overview,
                      style: GoogleFonts.montserrat(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
