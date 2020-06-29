import 'dart:async';
import 'package:movie_app/src/models/detail_item_model.dart';
import 'package:movie_app/src/resources/movie_details_api_provider.dart';

import 'popular_movies_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  int movieId;

  final popularMoviesApiProvider = PopularMoviesApiProvider();
  var movieDetailsApiProvider = MovieDetailsApiProvider(419704);

  Future<ItemModel> fetchPopularMovies() =>
      popularMoviesApiProvider.fetchMovieList();
  Future<DetailItemModel> fetchMovieDetails() =>
      movieDetailsApiProvider.fetchMovieDetailList();
}
