import 'package:enter_komputer_test/features/movies/domain/entity/genre.dart';

abstract class GenreRepository {
  Future<List<Genre>> getListGenre();
}