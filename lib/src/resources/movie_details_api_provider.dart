import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:movie_app/src/models/detail_item_model.dart';
import 'dart:convert';
import '../models/item_model.dart';

class MovieDetailsApiProvider {
  Client client = Client();
  final _apiKey = 'c6396876f6d8074ed2cd825b08fa8460';
  final movieId;

  MovieDetailsApiProvider(this.movieId);

  Future<DetailItemModel> fetchMovieDetailList() async {
    print("entered");
    final response = await client.get(
        "https://api.themoviedb.org/3/movie/${movieId}?api_key=${_apiKey}&language=en-US");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return DetailItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
