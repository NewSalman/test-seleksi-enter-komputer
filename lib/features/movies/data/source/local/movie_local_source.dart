import 'dart:developer';

import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/data/models/movie_model.dart';
import 'package:localstore/localstore.dart';

class MovieLocalSource {
  final _db = Localstore.instance;


  Future<void> getWatchList() async {
    final values = await _db.collection(Constants.watchList).get();

    log(values.toString());
  }

  Future<void> getFavoriteList() {
    return _db.collection(Constants.favorite).get();
  }

  Future<void> addToWatchList(MovieModel movie) {
    return _db.collection(Constants.watchList).doc(movie.id.toString()).set(movie.toJson());
  }

  Future<void> addToFavorite(MovieModel movie) {
    return _db.collection(Constants.favorite).doc(movie.id.toString()).set(movie.toJson());
  }

  Future<void> removeFromFavorite(MovieModel movie) {
    return _db.collection(Constants.favorite).doc(movie.id.toString()).delete();
  }

  Future<void> removeFromWatchList(MovieModel movie) {
    return _db.collection(Constants.watchList).doc(movie.id.toString()).delete();
  }

}