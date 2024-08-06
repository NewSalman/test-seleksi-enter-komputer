import 'package:flutter/material.dart';

// separating component for more readable and clean code


class LoadingSpinner extends StatefulWidget {
  const LoadingSpinner({super.key});

  @override
  State<LoadingSpinner> createState() => _LoadingSpinnerState();
}

class _LoadingSpinnerState extends State<LoadingSpinner> with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this
  )..repeat(reverse: false);

  late final CurvedAnimation _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear);

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Image(image: const AssetImage("assets/png/dvd.png"), width: MediaQuery.of(context).size.width * .1),
    );
  }
}