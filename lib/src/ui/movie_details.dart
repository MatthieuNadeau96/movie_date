import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MovieDetails extends StatelessWidget {
  final index;
  final results;

  MovieDetails(
    this.index,
    this.results,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              child: Hero(
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${results[index].poster_path}',
                  fit: BoxFit.cover,
                ),
                tag: 'card ${[index]}',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    results[index].title,
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
            ),
          ],
        ));
  }
}
