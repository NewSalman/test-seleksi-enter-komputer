import 'package:enter_komputer_test/features/movies/presenter/pages/home/home_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToWatchlistButton extends StatelessWidget {
  const AddToWatchlistButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageNotifier>(
      builder: (context, value, child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton.icon(
            onPressed: () {}, 
            icon: const Icon(Icons.add_rounded, size: 15), 
            label: const Text("Add to Watchlist", style: TextStyle(
                fontSize: 12,
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.yellowAccent
            ),
          ),
        );
      },
    );
  }
}