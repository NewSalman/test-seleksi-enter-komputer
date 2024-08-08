
import 'package:dio/dio.dart';
import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/data/models/genre_model.dart';

class GenreRemoteSource {
  final Dio _dio;

  GenreRemoteSource(this._dio);

  Future<List<GenreModel>> getListGenres() {
    return _dio.get(Constants.genreURL)
    .then((response) => GenreModel.fromResponse(response.data["genres"]));
  }

}