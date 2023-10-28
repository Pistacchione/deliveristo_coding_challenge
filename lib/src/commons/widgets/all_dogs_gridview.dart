import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/dog_response.dart';

class AllDogsGridView extends StatelessWidget {
  final List<RandomDogResponse> dogs;
  const AllDogsGridView({required this.dogs, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: dogs[index].url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
              ),
            ),
            placeholder: (context, url) => Transform.scale(
              scale: 0.2,
              child: const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
