import 'package:enter_komputer_test/features/movies/domain/entity/movie_detail.dart';
import 'package:enter_komputer_test/features/movies/domain/repository/movie_repository.dart';
import 'package:flutter/material.dart';


class MovieDetailNotifier extends ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieDetail? _movieDetail;
  MovieDetail? get movieDetail => _movieDetail;


  MovieDetailNotifier(this._movieRepository);

  Future<void> getMovieDetail(int? id) async {
    try {
      _movieDetail = await _movieRepository.getMovieDetail(id);
    } catch (e) {
      _movieDetail = null;
    }

    notifyListeners();
  } 
}