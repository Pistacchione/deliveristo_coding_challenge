import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DogImageLoader extends StatelessWidget {
  final String url;
  const DogImageLoader({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        key: const ValueKey('randomDogImage'),
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
        ),
      ),
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
    );
  }
}
