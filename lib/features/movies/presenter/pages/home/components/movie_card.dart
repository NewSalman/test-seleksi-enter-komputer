import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/domain/entity/movie.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/components/genre_chips.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  MovieCard({super.key, required this.movie});


  TextStyle textStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * .3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(builder: (bCtx) {
            return Container(
              child: Image.network(
                Constants.imageURL + movie.backdropPath!,
                width: MediaQuery.of(bCtx).size.width * .3,
                height: MediaQuery.of(bCtx).size.height,
                fit: BoxFit.cover,
              ),
            );
          }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(movie.title ?? "", style: textStyle),
                        Text.rich(
                          TextSpan(
                            style: textStyle.copyWith(fontSize: 9),
                            children: [
                              const TextSpan(text: "Lang: "),
                              TextSpan(text: movie.originalLanguage)
                            ]
                          )
                        ),
                        Text.rich(
                          TextSpan(
                            style: textStyle.copyWith(fontSize: 9),
                            children: [
                              const TextSpan(text: "Release date: "),
                              TextSpan(text: movie.releaseDate)
                            ]
                          )
                        ),
                        Text.rich(
                          TextSpan(
                            style: textStyle.copyWith(fontSize: 9),
                            children: [
                              const TextSpan(text: "vote: "),
                              TextSpan(text: (movie.voteCount ?? 0).toString())
                            ]
                          )
                        ),
                        Text.rich(
                          TextSpan(
                            style: textStyle.copyWith(fontSize: 9),
                            children: [
                              const TextSpan(text: "genres: "),
                              ...movie.genres.map((e) => TextSpan(text: ("${e.name ?? ""}, ").toLowerCase())).toList()
                            ]
                          )
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {}, 
                              icon: const Icon(Icons.favorite_border_rounded, size: 12), 
                              label: const Text("Add Favorite", style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {}, 
                              icon: const Icon(Icons.add, size: 12),
                              label: const Text("Add to Watchlist", style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ),
                          ),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}