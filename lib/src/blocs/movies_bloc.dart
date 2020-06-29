import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import 'package:movie_app/src/models/detail_item_model.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();
  final _movieDetailFetcher = PublishSubject<DetailItemModel>();

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;
  Observable<DetailItemModel> get movieDetails => _movieDetailFetcher.stream;

  fetchPopularMovies() async {
    ItemModel popularMovieModel = await _repository.fetchPopularMovies();
    _moviesFetcher.sink.add(popularMovieModel);
  }

  fetchMovieDetails() async {
    DetailItemModel detailMoviemodel = await _repository.fetchMovieDetails();
    _movieDetailFetcher.sink.add(detailMoviemodel);
  }

  dispose() {
    _moviesFetcher.close();
    _movieDetailFetcher.close();
  }
}

final bloc = MoviesBloc();
