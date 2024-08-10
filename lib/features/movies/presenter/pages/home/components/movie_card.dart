import 'package:enter_komputer_test/core/components/add_favorite_button.dart';
import 'package:enter_komputer_test/core/components/add_watchlist_button.dart';
import 'package:enter_komputer_test/core/components/custom_snackbar.dart';
import 'package:enter_komputer_test/core/components/image_network_loader.dart';
import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/domain/entity/movie.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/playlist/playlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool includeActions;
  const MovieCard({super.key, required this.movie, this.includeActions = true});


  final TextStyle textStyle = const TextStyle(
    fontSize: 20,
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
            return ImageNetworkLoader(
              url: Constants.imageURL + movie.backdropPath!,
              size: Size(MediaQuery.of(bCtx).size.width * .3, MediaQuery.of(bCtx).size.height),
              boxFit: BoxFit.cover,
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
                            style: textStyle.copyWith(fontSize: 16),
                            children: [
                              const TextSpan(text: "Lang: "),
                              TextSpan(text: movie.originalLanguage)
                            ]
                          )
                        ),
                        Text.rich(
                          TextSpan(
                            style: textStyle.copyWith(fontSize: 16),
                            children: [
                              const TextSpan(text: "Release date: "),
                              TextSpan(text: movie.releaseDate)
                            ]
                          )
                        ),
                        Text.rich(
                          TextSpan(
                            style: textStyle.copyWith(fontSize: 16),
                            children: [
                              const TextSpan(text: "vote: "),
                              TextSpan(text: (movie.voteCount ?? 0).toString())
                            ]
                          )
                        ),
                      ],
                    ),
                  ),
                  includeActions 
                  ?  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddToFavoriteButton(
                        onPressed: () {
                          context.read<PlaylistNotifier>().addToFavorite(movie)
                          .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(successSnackbar);
                          })
                          .catchError((_) {
                            ScaffoldMessenger.of(context).showSnackBar(failedSnackbar);
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      AddToWatchlistButton(
                        onPressed: () {
                          context.read<PlaylistNotifier>().addToWatchlist(movie)
                          .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(successSnackbar);
                          })
                          .catchError((_) {
                            ScaffoldMessenger.of(context).showSnackBar(failedSnackbar);
                          });
                        }
                      ),

                    ],
                  ) 
                  : const SizedBox.shrink(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}