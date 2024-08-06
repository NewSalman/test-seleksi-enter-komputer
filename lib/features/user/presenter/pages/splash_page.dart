import 'package:enter_komputer_test/core/components/loading.dart';
import 'package:enter_komputer_test/core/components/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
  
    Future.delayed(const Duration(seconds: 7), () => {
      context.goNamed("home")
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        height: double.infinity,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // adding image for thumbnail
            Image(image: const AssetImage("assets/images/movie.png"), width: MediaQuery.of(context).size.width * .3),
            const SizedBox(height: 12),
            const LoadingSpinner()
          ],
        ),
      )
    );
  }
}