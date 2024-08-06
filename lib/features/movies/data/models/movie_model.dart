import 'package:enter_komputer_test/features/movies/domain/entity/movie.dart';

class MovieModel extends Movie {
  // String? localId;

  MovieModel.fromEntity(Movie movie) {
    adult = movie.adult;
    backdropPath = movie.backdropPath;
    genreIds = movie.genreIds;
    id = movie.id;
    originalLanguage = movie.originalLanguage;
    originalTitle = movie.originalTitle;
    overview = movie.overview;
    popularity = movie.popularity;
    posterPath = movie.posterPath;
    releaseDate = movie.releaseDate;
    title = movie.title;
    video = movie.video;
    voteAverage = movie.voteAverage;
    voteCount = movie.voteCount;
    createdAt = movie.createdAt;
    updatedAt = movie.updatedAt;
    deletedAt = movie.deletedAt;
  }

  MovieModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id']; 
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }


  static List<MovieModel> fromResponse(List<dynamic> json) {
    return json.map((movie) => MovieModel.fromJson(movie)).toList();
  }
}