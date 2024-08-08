import 'package:enter_komputer_test/core/components/loading.dart';
import 'package:flutter/material.dart';

class ImageNetworkLoader extends StatelessWidget {
  final String url;
  final Size? size;
  final BoxFit? boxFit;
  const ImageNetworkLoader({super.key, required this.url, this.size, this.boxFit});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      loadingBuilder: (_, child, imageChunck) {
        if(imageChunck == null) {
          return child;
        }

        return const Center(
          child: LoadingSpinner(),
        );
      } ,  
      errorBuilder: (_, error, stackTrace) {
        return Center(
          child: Image(
            image: const AssetImage("assets/images/broken-file.png"), 
            width: MediaQuery.of(context).size.width * .15),
        );
      },
      height: size?.height,
      width: size?.width,
      fit: boxFit,
    );
  }
}