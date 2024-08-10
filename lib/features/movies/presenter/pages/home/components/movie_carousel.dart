import 'package:enter_komputer_test/core/components/image_network_loader.dart';
import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/home_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

          // if failed fetching data show this error
          if(state.nowPlayingState.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage("assets/images/fail.png"), 
                    width: MediaQuery.of(ctx).size.width * .2
                  ),
                  const Text("opss... please check your internet"),
                ],
              ),
            );
          }


          // creating now playing movie carousel
          return CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              height: MediaQuery.of(ctx).size.height,
              autoPlay: true,
            ),
            items: state.nowPlayingState.values.map((movie) {
              return GestureDetector(
                onTap: () {
                  context.goNamed("movie_detail", extra: movie.id.toString());
                },
                child: Stack(
                  children: [
                    ImageNetworkLoader(
                      url: Constants.imageURL + movie.backdropPath!,
                      size: Size.fromHeight(MediaQuery.of(ctx).size.height),
                      boxFit: BoxFit.fitHeight,  
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
                                ],
                              ),
                            )
                        ),
                      ),
                    )
                  ]
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}