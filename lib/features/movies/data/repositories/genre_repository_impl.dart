import 'package:enter_komputer_test/features/movies/data/models/genre_model.dart';
import 'package:enter_komputer_test/features/movies/data/source/local/genre_local_source.dart';
import 'package:enter_komputer_test/features/movies/data/source/remote/genre_remote_source.dart';
import 'package:enter_komputer_test/features/movies/domain/entity/genre.dart';
import 'package:enter_komputer_test/features/movies/domain/repository/genre_repository.dart';

class GenreRepositoryImpl extends GenreRepository {
  final GenreLocalSource _genreLocalSource;
  final GenreRemoteSource _genreRemoteSource;

  GenreRepositoryImpl(this._genreRemoteSource, this._genreLocalSource);

  @override
  Future<List<Genre>> getListGenre() async {
    try {
      List<GenreModel> genres = await _genreRemoteSource.getListGenres();
      await _genreLocalSource.saveGenreList(genres);

      return (await _genreLocalSource.getGenreList()) ?? List.empty();
    } catch(e) {
      return (await _genreLocalSource.getGenreList()) ?? List.empty();
    }
  }
}