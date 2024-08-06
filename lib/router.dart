import 'package:enter_komputer_test/features/authentication/presenter/pages/login_page.dart';
import 'package:enter_komputer_test/features/authentication/presenter/pages/splash_page.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home_page.dart';
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
      name: "login",
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: "home",
      path: "/home",
      builder: (context, state) => const HomePage(),
    ),
  ]
);