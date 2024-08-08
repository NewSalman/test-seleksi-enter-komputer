import 'package:enter_komputer_test/dependency_container.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/home_page_notifier.dart';
import 'package:enter_komputer_test/router.dart';
// ignore: unused_import
import 'package:localstore/localstore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageNotifier>(create: (_) => sl.get<HomePageNotifier>())
      ],
      child: MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(0xff25F75D, {
            50: Color(0xff21de54),
            100: Color(0xff1ec64a),
            200: Color(0xff1aad41),
            300: Color(0xff169438),
            400: Color(0xff137c2f),
            500: Color(0xff0f6325),
            600: Color(0xff0b4a1c),
            700: Color(0xff073113),
            800: Color(0xff041909),
            900: Color(0xff000000),
          }),
        )
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRoute,
    ),
    );
  }
}