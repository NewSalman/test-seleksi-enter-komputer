import 'package:enter_komputer_test/features/movies/domain/entity/genre.dart';
import 'package:enter_komputer_test/features/movies/domain/entity/movie.dart';
import 'package:enter_komputer_test/features/movies/domain/repository/genre_repository.dart';
import 'package:enter_komputer_test/features/movies/domain/repository/movie_repository.dart';
import 'package:flutter/material.dart';


class MovieState<T> {
  List<T> movies;
  Exception? error;
  // String? message;

  MovieState(this.movies,{this.error});
}

// class HomePageNotifier extends ChangeNotifier with ReassembleHandler {
class HomePageNotifier extends ChangeNotifier {
  final MovieRepository _movieRepository;
  final GenreRepository _genreRepository;

  // state property now playing movie 
  final List<Movie> _nowPlayingMovies = [];

  late MovieState nowPlayingState = MovieState<Movie>(_nowPlayingMovies); 


  // state property popular movie 
  final List<Movie> _popularMovies = [];
  late MovieState popularMoviesState = MovieState<Movie>(_nowPlayingMovies);

  // state property popular movie 
  final List<Genre> _genreList = [];
  late MovieState genreState = MovieState<Genre>(_genreList); 


  HomePageNotifier(this._movieRepository, this._genreRepository);

  Future<void> getNowPlayingMovies() async {

    try {
      _nowPlayingMovies.clear();
      _nowPlayingMovies.addAll((await _movieRepository.getPlayingMovies()).getRange(0, 5));
      nowPlayingState = MovieState(_nowPlayingMovies);
    } catch (e) {
      nowPlayingState = MovieState(List.empty() ,error: Exception());
    }
    notifyListeners();
  }

  Future<void> getPopularMovies() async {
    try {
      _popularMovies.clear();
      _popularMovies.addAll((await _movieRepository.getPopularMovies()));
      popularMoviesState = MovieState(_popularMovies);
    } catch (e) {
      popularMoviesState = MovieState(List.empty(), error: Exception());
    }
    notifyListeners();
  }

  Future<void> getGenreList() async {
    

    try {
      _genreList.clear();
      _genreList.addAll(await _genreRepository.getListGenre());

      genreState = MovieState(_genreList);
    } catch (e) {
      genreState = MovieState([], error: Exception("failed to load data"));
    }

    notifyListeners();
  }
}