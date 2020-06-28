import 'package:flutter/material.dart';

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
              'https://image.tmdb.org/t/p/w185${results[index].poster_path}',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  results[index].title,
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
