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
            title: const Text('Random image by breed'),
            trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
            onTap: () {
              const DogByBreedScreenRoute().go(context);
            },
          ),
          ListTile(
            title: const Text('Images list by breed'),
            trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Random image by breed and sub breed'),
            trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Images list by breed and sub breed'),
            trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
