import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const MainLayout({super.key, required this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SafeArea(child: body),
    );
  }
}