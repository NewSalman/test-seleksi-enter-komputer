import 'package:enter_komputer_test/core/components/add_favorite_button.dart';
import 'package:enter_komputer_test/core/components/add_watchlist_button.dart';
import 'package:enter_komputer_test/core/components/image_network_loader.dart';
import 'package:enter_komputer_test/core/components/main_layout.dart';
import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/dependency_container.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/components/genre_chips.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/movie_detail/movie_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:intl/intl.dart";

class MovieDetailPage extends StatefulWidget {
  final String? movieId;
  const MovieDetailPage({super.key, required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late final int? movieId = int.tryParse(widget.movieId ?? "");

  TextStyle titleTextStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );


  @override
  void initState() {
    super.initState();

    context.read<MovieDetailNotifier>().getMovieDetail(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieDetailNotifier>(
      builder: (_, value, child) {
        if(value.movieDetail == null) {
          return const MainLayout(
            body: SizedBox.shrink(),
          );
        }

        return MainLayout(
          body: ListView(
            children: [
              ImageNetworkLoader(
                url: Constants.imageURL + value.movieDetail!.backdropPath!,
                size: Size.fromHeight(MediaQuery.of(context).size.height * .4),
                boxFit: BoxFit.fitHeight,
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value.movieDetail?.originalTitle ?? "",
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      value.movieDetail?.releaseDate == null 
                      ? "" 
                      : DateFormat("d MMMM y").format(DateTime.parse(value.movieDetail!.releaseDate!)),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)
                    ),
                    const SizedBox(height: 12),
                    GenreChips(genres: value.movieDetail?.genres ?? []),
                    const SizedBox(height: 12),
                    const AddToFavoriteButton(),
                    const SizedBox(height: 6),
                    const AddToWatchlistButton(),


                    _infoGroup("Overview", value.movieDetail?.overview),
                    
                    

                    const SizedBox(height: 12),
                    Text("Production Companies", style: titleTextStyle),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                        children: value.movieDetail?.productionCompanies
                        ?.map((companies) {
                          return Text("${companies.name}, ", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400));
                        }).toList() ?? [],
                      ),
                        )
                      ],
                    ),

                    _infoGroup("Status", value.movieDetail?.status)
                  ],
                ),
              )
              
            ],
          ),
        );
      },
    );
  } 

  Widget _infoGroup(String? title, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(title ?? "", style: titleTextStyle),
        const SizedBox(height: 6),
        Text(value ?? "",
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)
        ),
      ],
    );
  }

}