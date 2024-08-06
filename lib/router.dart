import 'package:enter_komputer_test/features/user/presenter/pages/profile_page.dart';
import 'package:enter_komputer_test/features/user/presenter/pages/splash_page.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';



// define app routing and separating form main.dart for more readable

final appRoute = GoRouter(
  routes: [
    GoRoute(
      name: "splash",
      path: "/",
      builder:(context, state) => const SplashPage(),
    ),
    GoRoute(
      name: "profile",
      path: "/profile",
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      name: "home",
      path: "/home",
      builder: (context, state) => const HomePage(),
    ),
  ]
);