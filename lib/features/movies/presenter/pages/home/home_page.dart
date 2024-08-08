import 'package:enter_komputer_test/core/components/main_layout.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/components/movie_card.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/components/movie_carousel.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/home_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _notifier = context.read<HomePageNotifier>();

  @override
  void initState() {
    _notifier.getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // await _notifier.getPopularMovies();
        // await _notifier.getNowPlayingMovies();
        await _notifier.getGenreList();
      },
      child: MainLayout(
      body: ListView(
        primary: true,
        children: [
          const MovieCarouselWidget(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Popular Movies"),
          ),
    
          Consumer<HomePageNotifier>(
            builder:(context, homeState, child) {
    
              if(homeState.popularMoviesState.error != null) {
                return const SizedBox.shrink();
              }
    
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, i) => MovieCard(movie: homeState.popularMoviesState.movies[i]), 
                  separatorBuilder: (_, __) => const SizedBox(height: 8), 
                  itemCount: homeState.popularMoviesState.movies.length
                ),
              );
            },
          ),
        ],
      ),
        ),
    );
  }
}