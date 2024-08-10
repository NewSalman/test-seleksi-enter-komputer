import 'package:flutter/material.dart';

class AddToFavoriteButton extends StatelessWidget {
  final Function()? onPressed;
  const AddToFavoriteButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        onPressed: onPressed, 
        icon: const Icon(Icons.favorite_border_rounded, size: 12), 
        label: const Text("Add to Favorite", style: TextStyle(
            fontSize: 12,
          ),
        ),
      )
    );
  }
}