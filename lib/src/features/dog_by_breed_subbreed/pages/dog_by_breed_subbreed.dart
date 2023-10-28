import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/extensions/buildcontext_extension.dart';
import '../../../commons/widgets/breed_dropdown.dart';
import '../../../commons/widgets/dog_image_loader.dart';
import '../bloc/dog_by_breed_subbreed_cubit.dart';

class DogByBreedSubBreedPage extends StatelessWidget {
  const DogByBreedSubBreedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translate.dogByBreedSubBreedTitle(1))),
      body: BlocBuilder<DogByBreedSubBreedCubit, DogByBreedSubBreedState>(
        builder: (context, state) {
          switch (state) {
            case DogByBreedSubBreedStateInitial() || DogByBreedSubBreedStateLoading():
              return const Center(child: CircularProgressIndicator());
            case DogByBreedSubBreedStateError():
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: Text(state.message)),
              );
            case DogByBreedSubBreedStateListOfBreedSubBreed() || DogByBreedSubBreedStateDog():
              return Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BreedDropdown(
                        showSubBreed: true,
                        breeds: state.breeds,
                        onPressed: (selectedBreed, selectedSubBreed) {
                          context.read<DogByBreedSubBreedCubit>().getDobByBreedSubBreed(
                                breed: selectedBreed?.name,
                                subBreed: selectedSubBreed,
                              );
                        },
                      ),
                      if (state is DogByBreedSubBreedStateDog) DogImageLoader(url: state.dog.url),
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
