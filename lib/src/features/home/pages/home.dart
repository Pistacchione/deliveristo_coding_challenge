import 'package:flutter/material.dart';

import '../../../application/extensions/buildcontext_extension.dart';
import '../../../application/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translate.homeTitle)),
      body: ListView(
        children: [
          ListTile(
            key: const ValueKey('randomImageByBreed'),
            title: Text(context.translate.dogByBreedTitle(1)),
            trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
            onTap: () {
              const DogByBreedScreenRoute().go(context);
            },
          ),
          ListTile(
            title: Text(context.translate.dogByBreedTitle(2)),
            trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
            onTap: () {
              const AllDogsByBreedScreenRoute().go(context);
            },
          ),
          ListTile(
            title: Text(context.translate.dogByBreedSubBreedTitle(1)),
            trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
            onTap: () {
              const DogByBreedSubBreedScreenRoute().go(context);
            },
          ),
          ListTile(
            title: Text(context.translate.dogByBreedSubBreedTitle(2)),
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
