class DetailItemModel {
  final int vote_count;
  final int id;
  final bool video;
  final vote_average;
  final String title;
  final double popularity;
  final String poster_path;
  final String original_language;
  final String original_title;
  final String backdrop_path;
  final bool adult;
  final String overview;
  final String release_date;
  final int runtime;
  final int revenue;
  final int budget;

  DetailItemModel({
    this.vote_count,
    this.id,
    this.video,
    this.vote_average,
    this.title,
    this.popularity,
    this.poster_path,
    this.original_language,
    this.original_title,
    this.backdrop_path,
    this.adult,
    this.overview,
    this.release_date,
    this.runtime,
    this.revenue,
    this.budget,
  });

  factory DetailItemModel.fromJson(Map<String, dynamic> json) {
    return DetailItemModel(
      vote_count: json['vote_count'],
      id: json['id'],
      video: json['video'],
      vote_average: json['vote_average'],
      title: json['title'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      backdrop_path: json['backdrop_path'],
      adult: json['adult'],
      overview: json['overview'],
      release_date: json['release_date'],
      runtime: json['runtime'],
      revenue: json['revenue'],
      budget: json['budget'],
    );
  }
}
