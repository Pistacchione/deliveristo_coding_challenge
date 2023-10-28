import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/extensions/buildcontext_extension.dart';
import '../../../commons/widgets/breed_dropdown.dart';
import '../../../commons/widgets/dog_image_loader.dart';
import '../bloc/dog_by_breed_cubit.dart';

class DogByBreedPage extends StatelessWidget {
  const DogByBreedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translate.dogByBreedTitle(1))),
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
                        onPressed: (selectedBreed, _) {
                          context
                              .read<DobByBreedCubit>()
                              .getDobByBreed(breed: selectedBreed?.name);
                        },
                      ),
                      if (state is DogByBreedStateDog) DogImageLoader(url: state.dog.url),
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
