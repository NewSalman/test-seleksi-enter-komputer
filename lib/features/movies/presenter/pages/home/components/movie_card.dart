import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/domain/entity/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
          width: .5
        ),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          // BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.black)
        ]
      ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(movie.title ?? ""),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "Lang: "),
                              TextSpan(text: movie.originalLanguage)
                            ]
                          )
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "Release date: "),
                              TextSpan(text: movie.releaseDate)
                            ]
                          )
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "vote: "),
                              TextSpan(text: (movie.voteCount ?? 0).toString())
                            ]
                          )
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {}, 
                        icon: Icon(Icons.favorite_border_rounded, size: 12), 
                        label: Text("Add Favorite", style: TextStyle(
                            fontSize: 9,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: () {}, 
                        icon: Icon(Icons.add, size: 12),
                        label: Text("Add to Watchlist", style: TextStyle(
                            fontSize: 9,
                          ),
                        )
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