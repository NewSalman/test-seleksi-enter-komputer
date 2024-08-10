import 'package:enter_komputer_test/core/components/main_layout.dart';
import 'package:enter_komputer_test/features/movies/domain/entity/movie.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/components/movie_card.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/playlist/playlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaylistDetail extends StatelessWidget {
  final String? selected;
  const PlaylistDetail({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistNotifier>(
      builder: (context, value, child) {
        List<Movie> selectedMovie = [];

        if(selected == "favorite") {
          selectedMovie = value.favorite;
        } else {
          selectedMovie = value.watchlist;
        }

        return MainLayout(
          body: ListView.separated(
            itemBuilder: (_, i) => MovieCard(movie: selectedMovie[i], includeActions: false), 
            separatorBuilder: (_, __) => const SizedBox(height: 12), 
            itemCount: selectedMovie.length
          ),
        );
      },
    );
  }
}