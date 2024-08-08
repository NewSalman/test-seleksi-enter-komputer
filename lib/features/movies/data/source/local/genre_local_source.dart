import 'dart:developer';

import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/data/models/genre_model.dart';
import 'package:localstore/localstore.dart';

class GenreLocalSource {
 final _db = Localstore.instance;

  Future<dynamic> getGenreList() {
    return _db.collection(Constants.genre).get()
    .then((data) {
      return data;
    });
  } 

  Future<void> saveGenreList(List<GenreModel> genres) async {
    List<Map<String, dynamic>> json =  genres.map((e) => e.toJson()).toList();

    for (var genre in json) {
      if (await checkIfExits(genre["id"].toString())) continue;

      _db.collection(Constants.genre).doc(genre["id"].toString()).set(genre); 
    }
  }

  Future<bool> checkIfExits(String? id) async {
    if(id == null) return false;

    Map<String, dynamic>? local = await _db.collection(Constants.genre).doc(id.toString()).get();

    if(local == null) return false;

    return true;
  }
}