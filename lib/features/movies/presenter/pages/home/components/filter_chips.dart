import 'package:flutter/material.dart';

class MovieFilterChips extends StatelessWidget {
  const MovieFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(MediaQuery.of(context).size.height * .04),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: const [
          ChoiceChip(selected: false, backgroundColor: Colors.white, label: Text("vote"),)
        ],
      ),
    );
  }
}