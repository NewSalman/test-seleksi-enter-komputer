class Movie {
  int? id;
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  Movie(
      {this.id,
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});
}