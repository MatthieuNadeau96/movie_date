import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${results[index].poster_path}',
              fit: BoxFit.cover,
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
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  results[index].release_date.substring(0, 4),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${results[index].popularity.toStringAsFixed(0)} / 100',
                  style: TextStyle(
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
