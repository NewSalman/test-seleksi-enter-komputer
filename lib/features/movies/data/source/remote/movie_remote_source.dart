import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/data/models/movie_detail_model.dart';
import 'package:enter_komputer_test/features/movies/data/models/movie_model.dart';
import 'package:enter_komputer_test/features/movies/data/models/movie_request_model.dart';

class MovieRemoteSource {
  final Dio _dio;

  MovieRemoteSource(this._dio);

  Future<List<MovieModel>> getPopularMovies({String page = "1"}) {
    return _dio.get("movie/popular?page=$page")
    .then((response) => MovieModel.fromResponse(response.data["results"]));
  }

  Future<List<MovieModel>> getNowPlayingMovies({String page = "1"}) {
    return _dio.get("movie/now_playing?page=$page")
    .then((response) => MovieModel.fromResponse(response.data["results"]));
  }

  Future<List<MovieModel>> getFavorites({String page = "1"}) {
    return _dio.get("account/21424202/favorite/movies?page=$page&sort_by=created_at.asc")
    .then((response) => MovieModel.fromResponse(response.data["results"]));
  }

  Future<List<MovieModel>> getWatchList({String page = "1"}) {
    return _dio.get("account/${Constants.accountId}/watchlist/movies?page=$page&sort_by=created_at.asc")
    .then((response) => MovieModel.fromResponse(response.data["results"]));
  }

  Future<void> updateFavorite(int? id, bool value) {
    return _dio.post(
      "account/21424202/favorite",
      data: jsonEncode(MovieRequestModel(type: MovieRequestType.favorite, mediaId: id, value: value).toJson())
    );
  }

  Future<void> updateWatchList(int? id, bool value) {
    return _dio.post(
      "account/21424202/watchlist",
      data: jsonEncode(MovieRequestModel(type: MovieRequestType.wacthlist, mediaId: id, value: value).toJson())
    );
  }

  Future<MovieDetailModel> getMovieDetail(int? id) {
    return _dio.get("movie/$id?language=en-US")
    .then((response) => MovieDetailModel.fromJson(response.data));
  }

}