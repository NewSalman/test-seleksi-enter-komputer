import 'package:enter_komputer_test/features/movies/domain/entity/movie.dart';
import 'package:flutter/material.dart';

class GenreChips extends StatelessWidget {
  final Movie movie;
  const GenreChips({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: movie.genres.map((genre) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          margin: const EdgeInsets.only(right: 3),
          width: MediaQuery.of(context).size.width * .15,
          decoration: BoxDecoration(
            border: Border.all(
              width: .5
            ),
            borderRadius: BorderRadius.circular(50)
          ),
          child: Text(genre.name ?? "",
          textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 5,
              fontWeight: FontWeight.w500,
              
            ),
          ),
        );
      }).toList(),
    );
  }
}