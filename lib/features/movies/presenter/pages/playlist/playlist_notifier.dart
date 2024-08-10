import 'package:enter_komputer_test/features/movies/domain/entity/movie.dart';
import 'package:enter_komputer_test/features/movies/domain/repository/movie_repository.dart';
import 'package:flutter/material.dart';

class PlaylistNotifier extends ChangeNotifier {
  final MovieRepository _movieRepository;

  PlaylistNotifier(this._movieRepository);

  List<Movie> _favorites = [];
  List<Movie> get favorite => _favorites;

  List<Movie> _watchlist = [];
  List<Movie> get watchlist => _watchlist;


  Future<void> _getWatchlist() async {
    _watchlist.clear();
    _watchlist = await _movieRepository.getWatchList();
  } 
  
  Future<void> _getFavorites() async {
    _favorites.clear();
    _favorites = await _movieRepository.getFavorites();
  } 

  Future<void> addToWatchlist(Movie movie) async {
    await _movieRepository.saveToWatchList(movie);
  }

  Future<void> addToFavorite(Movie movie) async {
    await _movieRepository.saveToFavorite(movie);
  }

  Future<void> init() async {
    await _getFavorites();
    await _getWatchlist();
  }

  Future<void> refresh() async {
    await init();
    notifyListeners();
  }
}