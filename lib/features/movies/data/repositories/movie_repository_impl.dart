import 'package:enter_komputer_test/features/movies/data/models/movie_model.dart';
import 'package:enter_komputer_test/features/movies/data/source/local/movie_local_source.dart';
import 'package:enter_komputer_test/features/movies/data/source/remote/movie_remote_source.dart';
import 'package:enter_komputer_test/features/movies/domain/entity/movie.dart';
import 'package:enter_komputer_test/features/movies/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieLocalSource _movieLocalSource;
  final MovieRemoteSource _movieRemoteSource;

  MovieRepositoryImpl(this._movieLocalSource, this._movieRemoteSource);



  @override
  Future<List<Movie>> getPlayingMovies({String? page}) {
    return _movieRemoteSource.getNowPlayingMovies(page: page ?? "1");
  }

  @override
  Future<List<Movie>> getPopularMovies({String? page}) {
    return _movieRemoteSource.getPopularMovies(page: page ?? "1");
  }

  @override
  Future<void> saveImage() {
    // TODO: implement saveImage
    throw UnimplementedError();
  }
  
  @override
  Future<void> removeFromFavorite(Movie movie) {
    return _movieLocalSource.removeFromFavorite(MovieModel.fromEntity(movie));
  }
  
  @override
  Future<void> removeFromWatchList(Movie movie) {
    return _movieLocalSource.removeFromWatchList(MovieModel.fromEntity(movie));
  }
  
  @override
  Future<void> saveToFavorite(Movie movie) {
    return _movieLocalSource.addToFavorite(MovieModel.fromEntity(movie));
  }
  
  @override
  Future<void> saveToWatchList(Movie movie) {
    return _movieLocalSource.addToWatchList(MovieModel.fromEntity(movie));
  }

}