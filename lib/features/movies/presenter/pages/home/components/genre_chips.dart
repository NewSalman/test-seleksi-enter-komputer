import 'package:enter_komputer_test/features/movies/domain/entity/genre.dart';
import 'package:flutter/material.dart';

class GenreChips extends StatelessWidget {
  final List<Genre> genres;
  const GenreChips({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: genres.map((genre) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          margin: const EdgeInsets.only(right: 3),
          width: MediaQuery.of(context).size.width * .2,
          decoration: BoxDecoration(
            border: Border.all(
              width: .5
            ),
            borderRadius: BorderRadius.circular(50)
          ),
          child: Text(genre.name ?? "",
          textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              
            ),
          ),
        );
      }).toList(),
    );
  }
}