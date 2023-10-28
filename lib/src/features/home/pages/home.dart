import 'package:flutter/material.dart';

import '../../../application/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Dog')),
      body: ListView(
        children: [
          ListTile(
            key: const ValueKey('randomImageByBreed'),
            title: const Text('Dog by breed'),
            trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
            onTap: () {
              const DogByBreedScreenRoute().go(context);
            },
          ),
          ListTile(
            title: const Text('Dogs by breed'),
            trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
            onTap: () {
              const AllDogsByBreedScreenRoute().go(context);
            },
          ),
          ListTile(
            title: const Text('Dog by breed and sub breed'),
            trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
            onTap: () {
              const DogByBreedSubBreedScreenRoute().go(context);
            },
          ),
          ListTile(
            title: const Text('Dogs by breed and sub breed'),
            trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
            onTap: () {
              const AllDogsByBreedSubBreedScreenRoute().go(context);
            },
          ),
        ],
      ),
    );
  }
}
