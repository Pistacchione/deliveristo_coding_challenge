import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commons/models/breed.dart';
import '../bloc/all_dogs_by_breed_cubit.dart';

class AllDogsByBreedPage extends StatefulWidget {
  const AllDogsByBreedPage({super.key});

  @override
  State<AllDogsByBreedPage> createState() => _AllDogsByBreedPageState();
}

class _AllDogsByBreedPageState extends State<AllDogsByBreedPage> {
  Breed? selectedBreed;

  String get submitButtonText {
    if (selectedBreed != null) {
      return 'Get Dogs by ${selectedBreed?.name}';
    }

    return 'Get Dogs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Images list by breed')),
      body: BlocBuilder<AllDogsByBreedCubit, AllDogsByBreedState>(
        builder: (context, state) {
          switch (state) {
            case AllDogsByBreedStateInitial() || AllDogsByBreedStateLoading():
              return const Center(child: CircularProgressIndicator());
            case AllDogsByBreedStateError():
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: Text(state.message)),
              );
            case AllDogsByBreedStateListOfBreed() || AllDogsByBreedStateDogs():
              return Padding(
                padding: const EdgeInsets.all(16),
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
                                        .read<AllDogsByBreedCubit>()
                                        .getAllDogsByBreed(breed: selectedBreed?.name);
                                  }
                                : null,
                            child: Text(submitButtonText),
                          ),
                        ),
                      ],
                    ),
                    if (state is AllDogsByBreedStateDogs)
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: state.dogs.length,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              imageUrl: state.dogs[index].url,
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
                      ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}