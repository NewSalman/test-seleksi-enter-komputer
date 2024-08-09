import 'package:enter_komputer_test/features/movies/data/models/movie_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MovieLocalSource {

  final FlutterSecureStorage _db;

  MovieLocalSource(this._db);

}