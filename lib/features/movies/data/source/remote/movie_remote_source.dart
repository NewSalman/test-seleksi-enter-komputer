import 'package:dio/dio.dart';
import 'package:enter_komputer_test/features/movies/data/models/movie_model.dart';

class MovieRemoteSource {
  final Dio _dio;

  MovieRemoteSource(this._dio);

  Future<List<MovieModel>> getPopularMovies({String page = "1"}) {
    return _dio.get("popular?page=$page")
    .then((response) => MovieModel.fromResponse(response.data["results"]));
  }

  Future<List<MovieModel>> getNowPlayingMovies({String page = "1"}) {
    return _dio.get("now_playing?page=$page")
    .then((response) => MovieModel.fromResponse(response.data["results"]));
  }
}