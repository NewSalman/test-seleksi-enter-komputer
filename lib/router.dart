import 'package:enter_komputer_test/features/movies/presenter/pages/movie_detail/movie_detail_page.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/playlist/playlist_page.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/playlist_detail/playlist_detail_page.dart';
import 'package:enter_komputer_test/features/user/presenter/pages/splash_page.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';



// define app routing and separating form main.dart for more readable

final appRoute = GoRouter(
  routes: [
    GoRoute(
      name: "splash",
      path: "/",
      builder:(_, __) => const SplashPage(),
    ),
    GoRoute(
      name: "movie",
      path: "/movie",
      builder: (_, __) => const HomePage(),
      routes: [
        GoRoute(
          name: "movie_detail",
          path: "movie_detail",
          builder: (_, state) =>  MovieDetailPage(movieId: state.extra as String?)
        ),
        GoRoute(
          name: "movie_playlist",
          path: "movie_playlist",
          builder: (_, __) => const PlaylistPage(),
          routes: [
            GoRoute(
              name: "playlist_detail",
              path: "playlist_detail",
              builder: (_, state) => PlaylistDetail(selected: state.extra as String?)
            )
          ]
        )
      ]
    ),
  ]
);