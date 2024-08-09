import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToFavoriteButton extends StatelessWidget {
  const AddToFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton.icon(
            onPressed: () {}, 
            icon: const Icon(Icons.favorite_border_rounded, size: 12), 
            label: const Text("Add to Favorite", style: TextStyle(
                fontSize: 12,
              ),
            ),
          )
        );
      },
    );
  }
}