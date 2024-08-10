import 'package:enter_komputer_test/core/components/main_layout.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/components/movie_card.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/components/movie_carousel.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/home_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    super.initState();

    
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _notifier.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await _notifier.refresh();
      },
      child: MainLayout(
      body: Stack(
        children: [
          ListView(
            primary: true,
            children: [
              const MovieCarouselWidget(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Popular Movies", style: TextStyle(fontSize: 28)),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: const MovieFilterChips(),
              // ),

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
                      itemBuilder: (_, i) {
                        return GestureDetector(
                          onTap: () {
                            context.goNamed("movie_detail", extra: homeState.popularMoviesState.values[i].id.toString());
                          },
                          child: MovieCard(movie: homeState.popularMoviesState.values[i]),
                        );
                      }, 
                      separatorBuilder: (_, __) => const SizedBox(height: 8), 
                      itemCount: homeState.popularMoviesState.values.length
                    ),
                  );
                },
              ),
            ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton.icon(
              onPressed: () {
                context.goNamed("movie_playlist");
              }, 
              icon: const Icon(Icons.person), 
              label: const Text("Profile")
            ),
          ),
        ),
      ],
      ),
      ),
    );
  }
}