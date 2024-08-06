import 'package:enter_komputer_test/features/movies/domain/entity/movie.dart';

abstract class MovieRepository {
  // get now playing movies 
  Future<List<Movie>> getPlayingMovies({String? page});
  // get popular movies 
  Future<List<Movie>> getPopularMovies({String? page});


  // save movie to wacthlist
  Future<void> saveToWatchList(Movie movie);
  // save movie to Favorite
  Future<void> saveToFavorite(Movie movie);

  // removing from watchlist
  Future<void> removeFromWatchList(Movie movie);

  // removing from favorite
  Future<void> removeFromFavorite(Movie movie);

  // saving image in base64 
  Future<void> saveImage();
}