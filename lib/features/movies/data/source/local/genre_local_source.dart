import 'dart:convert';

import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/data/models/genre_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GenreLocalSource {
 final _db = const FlutterSecureStorage();

  Future<List<GenreModel>?> getGenreList() {
    return _db.read(key: Constants.genre)
    .then((data) {
      return jsonDecode(data ?? "");
    })
    .then((value) {
      return (value as List<dynamic>?)
        ?.map((e) => GenreModel.fromJson(e)).toList();
    });
  } 

  Future<void> saveGenreList(List<GenreModel> genres)  {
    return getGenreList()
    .then((localGenres) {
      for (var i = 0; i < genres.length; i++) {
        bool isContain = localGenres?.contains(genres[i]) ?? false;
        if(isContain) {
          genres.removeAt(i);
        }
      }
      return genres;
    })
    .then((remain) async {
      if(remain.isNotEmpty) {
        _db.write(key: Constants.genre, value: jsonEncode(remain.map((e) => e.toJson())));
      }
    });
  }
}