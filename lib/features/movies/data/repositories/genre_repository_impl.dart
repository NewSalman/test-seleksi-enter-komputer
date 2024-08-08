import 'dart:developer';

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
      var localGenres = await _genreLocalSource.getGenreList();

      print(localGenres["\\genres\\10402"]);

      return [];
    } catch(e) {
      return [];
    }
  }

  Future<void> _saveListGenre(List<GenreModel> genres) async {
    await _genreLocalSource.saveGenreList(genres);
  }
}