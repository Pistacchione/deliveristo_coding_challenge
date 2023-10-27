import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commons/models/breed.dart';
import '../bloc/dog_by_breed_cubit.dart';

class DogByBreedPage extends StatefulWidget {
  const DogByBreedPage({super.key});

  @override
  State<DogByBreedPage> createState() => _DogByBreedPageState();
}

class _DogByBreedPageState extends State<DogByBreedPage> {
  Breed? selectedBreed;

  String get submitButtonText {
    if (selectedBreed != null) {
      return 'Get Dog by ${selectedBreed?.name}';
    }

    return 'Get Dog';
  }

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Breed'),
                          DropdownButton(
                            key: const ValueKey('breedDropDown'),
                            items: state.breeds.map((breed) {
                              return DropdownMenuItem(
                                value: breed,
                                child: Text(breed.name),
                              );
                            }).toList(),
                            value: selectedBreed,
                            onChanged: (value) {
                              setState(() {
                                selectedBreed = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: selectedBreed != null
                                  ? () {
                                      context
                                          .read<DobByBreedCubit>()
                                          .getDobByBreed(breed: selectedBreed?.name);
                                    }
                                  : null,
                              child: Text(submitButtonText),
                            ),
                          ),
                        ],
                      ),
                      if (state is DogByBreedStateDog)
                        CachedNetworkImage(
                          imageUrl: state.dog.url,
                          imageBuilder: (context, imageProvider) => Container(
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
