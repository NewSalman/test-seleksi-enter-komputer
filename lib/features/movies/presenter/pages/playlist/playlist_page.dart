import 'package:enter_komputer_test/core/components/main_layout.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/playlist/playlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<PlaylistPage> {
  @override
  void initState() {
    super.initState();

    context.read<PlaylistNotifier>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistNotifier>(
      builder: (context, value, child) {
        return MainLayout(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("My Playlist", style: TextStyle(fontSize: 28)),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    context.goNamed("playlist_detail", extra: "watchlist");
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("My Watchlist", style: TextStyle(fontSize: 32)),
                      Text("${value.watchlist.length} movies"),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    context.goNamed("playlist_detail", extra: "favorite");
                    
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("My Favorite", style: TextStyle(fontSize: 32)),
                      Text("${value.favorite.length} movies"),
                    ],
                  ),
                ),
              ],
            ),
          )
        );
      }
    );
  }
}