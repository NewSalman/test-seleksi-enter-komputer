import 'package:enter_komputer_test/core/components/loading.dart';
import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/components/genre_chips.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/home_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieCarouselWidget extends StatefulWidget {
  const MovieCarouselWidget({super.key});

  @override
  State<MovieCarouselWidget> createState() => _MovieCarouselWidgetState();
}

class _MovieCarouselWidgetState extends State<MovieCarouselWidget> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .6,
      child: Consumer<HomePageNotifier>(
        builder: (ctx, state, child) {
          if(state.nowPlayingState.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage("assets/images/fail.png"), 
                    width: MediaQuery.of(ctx).size.width * .2
                  ),
                  const Text("opss..."),
                ],
              ),
            );
          }
    
          return CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              height: MediaQuery.of(ctx).size.height,
              autoPlay: true,
            ),
            items: state.nowPlayingState.values.map((movie) {
              return Stack(
                children: [
                  Image.network(
                    Constants.imageURL + movie.backdropPath!,
                    loadingBuilder: (_, child, imageChunck) {
                      if(imageChunck == null) {
                        return child;
                      }

                      return const Center(
                        child: LoadingSpinner(),
                      );
                    } ,  
                    errorBuilder: (_, error, stackTrace) => const Text("test"),
                    height: MediaQuery.of(ctx).size.height,
                    fit: BoxFit.fitHeight,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.white.withOpacity(0.8), Colors.transparent],

                        ).createShader(rect);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                          width: MediaQuery.of(ctx).size.width,
                          height: MediaQuery.of(ctx).size.height * .25,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  movie.originalTitle ?? "",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Builder(
                                  builder: (_) {
                                    if(state.genreState.error != null) {
                                      return const SizedBox.shrink();
                                    }

                                    return GenreChips(movie: movie);
                                  },
                                )

                                // Builder(
                                //   builder: (context) {
                                //     return Row(
                                //       children: movie.genreIds?.map((e) => Text(e.toString())).toList() ?? [],
                                //     );
                                //   },
                                // )

                                
                              ],
                            ),
                          )
                      ),
                    ),
                  )
                ]
              );
            }).toList(),
          );
        },
      ),
    );
  }
}