import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/src/ui/movie_details.dart';

class MovieCard extends StatelessWidget {
  final index;
  final results;

  MovieCard(
    this.index,
    this.results,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(index, results),
                  ),
                );
              },
              child: Hero(
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${results[index].poster_path}',
                  fit: BoxFit.cover,
                ),
                tag: 'card ${[index]}',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  results[index].title,
                  maxLines: 1,
                  minFontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  results[index].release_date.substring(0, 4),
                  style: GoogleFonts.montserrat(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${results[index].popularity.toStringAsFixed(0)} / 100',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
