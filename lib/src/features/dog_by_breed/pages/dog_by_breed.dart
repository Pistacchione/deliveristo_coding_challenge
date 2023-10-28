import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commons/widgets/breed_dropdown.dart';
import '../bloc/dog_by_breed_cubit.dart';

class DogByBreedPage extends StatelessWidget {
  const DogByBreedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random image by breed')),
      body: BlocBuilder<DobByBreedCubit, DogByBreedState>(
        builder: (context, state) {
          switch (state) {
            case DogByBreedStateInitial() || DogByBreedStateLoading():
              return const Center(child: CircularProgressIndicator());
            case DogByBreedStateError():
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: Text(state.message)),
              );
            case DogByBreedStateListOfBreed() || DogByBreedStateDog():
              return Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BreedDropdown(
                        breeds: state.breeds,
                        onPressed: (selectedBreed) {
                          context.read<DobByBreedCubit>().getDobByBreed(breed: selectedBreed?.name);
                        },
                      ),
                      if (state is DogByBreedStateDog)
                        CachedNetworkImage(
                          imageUrl: state.dog.url,
                          imageBuilder: (context, imageProvider) => Container(
                            key: const ValueKey('randomDogImage'),
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 1.5,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
                            ),
                          ),
                          placeholder: (context, url) => const CircularProgressIndicator(),
                        ),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
